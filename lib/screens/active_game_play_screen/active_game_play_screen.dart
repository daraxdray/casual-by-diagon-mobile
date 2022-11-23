import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/models/game_result_model.dart';
import '../../app/providers/user_provider.dart';
import '../../app/routes/routes.dart';
import '../../app/services/auth_service.dart';
import 'controller/active_game_play_controller.dart';



class ActiveGamePlayScreen extends StatefulWidget {
  const ActiveGamePlayScreen({Key? key}) : super(key: key);

  @override
  _GameActivePlayScreenState createState() =>
      _GameActivePlayScreenState();
}

class _GameActivePlayScreenState extends State<ActiveGamePlayScreen> {
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
  final UserProvider userProvider = UserProvider();
  final DgAuthService dgAuth = DgAuthService();
  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  int accumulated = 0;
  GameResult gameResult = GameResult.fromJson({});
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
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = contextMenuItemClicked.androidId;
          print("onContextMenuActionItemClicked: " +
              id.toString() +
              " " +
              contextMenuItemClicked.title);
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


  void processGameResult() async {
    print(gameResult.event);
    switch(gameResult.event){
      case "EVENT_LEVELSTART":
        break;
      case "EVENT_PAUSE":
        break;
      case "EVENT_LEVELFAIL":
        break;
      case "EVENT_RESUME":
        break;
      case "EVENT_LEVELSCORE":
      case "EVENT_TOTALSCORE":
        userProvider.setGameScore(gameResult);
        break;
      default:
        print(gameResult.event);
    }


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
                      URLRequest(url: Uri.parse(Get.arguments['url'])),
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
                          try{
                            if(callback[0].runtimeType.toString() == '_InternalLinkedHashMap<String, dynamic>') {
                              Map<String,
                                  dynamic> logMessage = callback[0] as Map<
                                  String,
                                  dynamic>;
                              gameResult = GameResult.fromJson(logMessage);
                              accumulated += (gameResult.params?.levelScore ?? gameResult.params?.totalScore)! ?? 0;
                              processGameResult();

                            }else{
                              //do other things with non game event messages
                            }}catch(e){

                          }
                        });
                        print(await controller.getUrl());
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
        onWillPop: () async{

        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to Quit Game?'),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    gameResult.accumulated = accumulated;
                    Navigator.pop(context, true);
                    Get.offAllNamed(DgRoutes.authRoute(DgRoutes.gamePlayGameOver),arguments: gameResult);

                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
    });
  }
}

