


import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/utils/index.dart';

class BrowserScreen extends StatefulWidget {
  const BrowserScreen({Key? key}) : super(key: key);

  @override
  _BrowserScreenState createState() =>
      _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewOptions settings = InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    allowFileAccessFromFileURLs: true,
    // frame: "camera; microphone",
    // iframeAllowFullscreen: true
  );

  PullToRefreshController? pullToRefreshController;
  late ContextMenu contextMenu;
  String url = "";
  String? image;
  double progress = 0;
  final urlController = TextEditingController();
  int accumulated = 0;
  bool willpop = false;

  @override
  void initState() {
    super.initState();
    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
            // id: 1,
              title: "Special",
              action: () async {
                await webViewController?.clearFocus();
              })
        ],
        // settings: ContextMenuSettings(hideDefaultSystemContextMenuItems: false),
        onCreateContextMenu: (hitTestResult) async {
          // print("onCreateContextMenu");
          // print(hitTestResult.extra);
          // print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          // print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = contextMenuItemClicked.androidId;
          // print("onContextMenuActionItemClicked: " +
          //     id.toString() +
          //     " " +
          //     contextMenuItemClicked.title);
        });

    pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
      onRefresh: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          webViewController?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          webViewController?.loadUrl(
              urlRequest:
              URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    webViewController = null;
    pullToRefreshController = null;

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        // drawer: myDrawer(context: context),
        body: SafeArea(
            child: Column(children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              //   controller: urlController,
              //   keyboardType: TextInputType.text,
              //   onSubmitted: (value) {
              //     var url = Uri.parse(value);
              //     if (url.scheme.isEmpty) {
              //       url = Uri.parse((!kIsWeb
              //           ? "https://www.google.com/search?q="
              //           : "https://www.bing.com/search?q=") +
              //           value);
              //     }
              //     webViewController?.loadUrl(urlRequest: URLRequest(url: url));
              //   },
              // ),
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest:
                      URLRequest(url: Uri.parse(Get.arguments != null? Get.arguments['url']: "https://diagon.io")),
                      // initialUrlRequest:
                      // URLRequest(url: Uri.parse(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
                      // initialFile: "assets/index.html",
                      initialUserScripts: UnmodifiableListView<UserScript>([]),
                      initialOptions: InAppWebViewGroupOptions(crossPlatform: settings),
                      // contextMenu: contextMenu,
                      // pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) async {
                        webViewController = controller;
                        webViewController?.addJavaScriptHandler(handlerName: 'handleResult', callback: (callback){
                          //check if message is game event

                        });
                        // print(await controller.getUrl());
                      },
                      onLoadStart: (controller, url) async {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      // onPermissionRequest: (controller, request) async {
                      //   return PermissionResponse(
                      //       resources: request.resources,
                      //       action: PermissionResponseAction.GRANT);
                      // },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url!;

                        if (![
                          "http",
                          "https",
                          "file",
                          "chrome",
                          "data",
                          "javascript",
                          "about"
                        ].contains(uri.scheme)) {
                          if (await canLaunchUrl(uri)) {
                            // Launch the App
                            await launchUrl(
                              uri,
                            );
                            // and cancel the request
                            return NavigationActionPolicy.CANCEL;
                          }
                        }

                        return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (controller, url) async {
                        pullToRefreshController?.endRefreshing();
                        await controller.evaluateJavascript(source: """
                           
                            window.addEventListener("message", (event) => {       
                             
                             window.flutter_inappwebview
                            .callHandler('handleResult',event.data);
                             
                            }, false);
                          """);
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      // onReceivedError: (controller, request, error) {
                      //   pullToRefreshController?.endRefreshing();
                      // },
                      onProgressChanged: (controller, progress) {
                        // if (progress == 100) {
                        //   pullToRefreshController?.endRefreshing();
                        // }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = this.url;
                        });
                      },
                      onUpdateVisitedHistory: (controller, url, isReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        debugPrint(consoleMessage.toString());
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
            ]))),
        onWillPop: () async {
       await  Get.defaultDialog(
              title: "Exit!",
              titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              middleText: "Do you want to exit this page?",
              middleTextStyle: TextStyle(fontSize: 12, color: Colors.white),
              backgroundColor: AppColors.bluegray800Cc,
              onConfirm: (){
                Get.back();
                setState(() {
                  willpop =  true;
                });

              },
              onCancel: (){setState(() {
                willpop =  false;
              });
              });

    return willpop;
        });
  }
}

