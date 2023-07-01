import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:casual/widgets/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/models/game_result_model.dart';
import '../../app/providers/user_provider.dart';
import '../../app/routes/routes.dart';
import '../../app/services/auth_service.dart';
import '../../app/utils/global_key_factory.dart';
import '../../app/utils/index.dart';
import '../../widgets/common_image_view.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/active_game_play_controller.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';



class ActiveGamePlayScreen extends StatefulWidget  {
  const ActiveGamePlayScreen({Key? key}) : super(key: key);

  @override
  _GameActivePlayScreenState createState() =>
      _GameActivePlayScreenState();
}

//USer Binding for monitoring pause events.
// with WidgetsBindingObserver
class _GameActivePlayScreenState extends State<ActiveGamePlayScreen>  with WidgetsBindingObserver {
  final GlobalKey webViewKey = GlobalKeyFactory.generateUniqueKey();
  InAppWebViewController? webViewController;
  InAppWebViewOptions settings = InAppWebViewOptions(
    useShouldOverrideUrlLoading: true,
    mediaPlaybackRequiresUserGesture: false,
    allowFileAccessFromFileURLs: true,
    // frame: "camera; microphone",
    // iframeAllowFullscreen: true
  );
  final UserProvider userProvider = UserProvider();
  // final DgAuthService dgAuth = DgAuthService();
  late ContextMenu contextMenu;
  String url = "";
  String? image;
  String? title;
  bool scoreSent = false;
  double progress = 0;
  int accumulated = 0;
  GameResult gameResult = GameResult.fromJson({});
  //Time implementation
  int totalSec = 0;
  DateTime initialTime = DateTime.now();
  DateTime diffTime = DateTime.now();
  String gameState = 'start';  //this will check and update game state in ordder to manage seconds
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,

      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
        useWideViewPort: false,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));


  Timer? countdownTimer;

  // Step 3
  void startTimer() {
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(const Duration(seconds: 1,), (_) => setCountUp());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() {
      totalSec = 0;
    });
  }

  // Step 6
  void setCountUp() {
    setState(() {
      totalSec+= 1;
    });
  }



  @override
  void initState() {
    super.initState();
    image = Get.arguments['image'];
    title = Get.arguments['title'];
    url = Get.arguments['url'];
    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void dispose() {
    super.dispose();
    webViewController = null;
    WidgetsBinding.instance.removeObserver(this);
  }

  //Monitors paused events
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.paused || state == AppLifecycleState.inactive || state == AppLifecycleState.detached){
      stopTimer();
    }
    if(state == AppLifecycleState.resumed){
      startTimer();
    };
  }


  void setAndSendScore(int score) async {
    gameResult.params?.levelScore = score;
    await userProvider.setGameScore(gameResult);
    scoreSent = true;
  }

  void processGameResult() async {
    print(gameResult.event);
    print(totalSec);
    infoSnack("ASD", gameResult.event);
    switch(gameResult.event){
      case "EVENT_CUSTOM":
        //OMNOM RUN
      //BUBBLE WOODS
        break;
      case "EVENT_LEVELSTART":
      case "EVENT_LEVELRESTART":
        scoreSent = false;
        initialTime = DateTime.now();
        totalSec = 0;
        startTimer();
        break;
      case "EVENT_PAUSE":
      //list of games available for this event
      //   totalSec += DateTime.now().difference(initialTime).inSeconds;
        gameState = 'pause';
        stopTimer();
        break;
      case "EVENT_LEVELFAIL":
      //list of games available for this event
      //CITYDUNK
      //OMRUN
      //TRUCK
      stopTimer();
      //BUBBLE WOODS
      //ensure that game is not in pause
      if(gameResult.gameID == "billiard-blitz-challenge") {
        accumulated += totalSec; //GETS ACCUMULATED SCORE FOR BLITZ
        //accumulated += 75;
        setAndSendScore(totalSec);
      }
      else if(gameResult.gameID == "table-tennis-world-tour"){
        accumulated += totalSec; // GETS ACCUMULATED SCORE FOR TENNIS
        //accumulated += 50
        setAndSendScore(totalSec);
      }
      else if(gameResult.gameID == "3d-chess"){
        accumulated += totalSec; // GETS ACCUMULATED SCORE FOR CHESS
        //accumulated += 125
        setAndSendScore(totalSec);
      }
        // if(gameResult.gameID == "3d-chess"){
        //   accumulated += 80; // GETS ACCUMULATED SCORE FOR CHESS
        //   setAndSendScore(80);
        // }
            break;
      case "EVENT_TUTORIALCOMPLETED":
        break;
      case "EVENT_RESUME":
      //list of games available for this event
        gameState = 'start';
        startTimer();
        // initialTime = DateTime.now();
        break;
      case "EVENT_LEVELSUCCESS":
      //list of games available for this event
        //CURSED MARBLES
        //BILLIARDS CLASSIC
      //TENNIS
      //CHESS
      // totalSec = DateTime.now().difference(initialTime).inSeconds;
        stopTimer();
        if(gameResult.gameID == "billiard-blitz-challenge") {
          accumulated += totalSec; //GETS ACCUMULATED SCORE FOR BLITZ
          //accumulated += 75;
          setAndSendScore(totalSec);
        }
        else if(gameResult.gameID == "table-tennis-world-tour"){
          accumulated += totalSec; // GETS ACCUMULATED SCORE FOR TENNIS
          //accumulated += 50
          setAndSendScore(totalSec);
        }
        else if(gameResult.gameID == "3d-chess"){
          accumulated += totalSec; // GETS ACCUMULATED SCORE FOR CHESS
          //accumulated += 125
          setAndSendScore(totalSec);
        }

        break;
      case "EVENT_LEVELSCORE":
      //list of games available for this event
      //   totalSec = DateTime.now().difference(initialTime).inSeconds;
      stopTimer();
        if(gameResult.gameID == "archery-world-tour" ) {
          accumulated += totalSec; // GETS ACCUMULATED SCORE FOR TOUR
          // accumulated += gameResult.params?.totalScore ?? 0;
          // setAndSendScore(gameResult.params?.levelScore ?? 0);
          setAndSendScore(totalSec);
        }
        break;
      case "EVENT_TOTALSCORE":
        //list of games available for this event
      List<String> gameList = ["knife-rain","om-nom-run","endless-truck","city-dunk","bubble-woods","totemia-cursed-marbles"];
      stopTimer();

      //CITYDUNK
      //OMNUM RUN
      //TRUCK
      //BUBBLE WOODS
      //Cursed Marbles
      //KNIFE RAIN
      // totalSec = DateTime.now().difference(initialTime).inSeconds;

      if(scoreSent == false && gameList.contains(gameResult.gameID)) {
          // accumulated += gameResult.params?.totalScore ?? 0;
          accumulated += totalSec;
          gameResult.params?.levelScore = totalSec;
          await userProvider.setGameScore(gameResult);
          scoreSent = true;
        }
      if(gameResult.gameID == 'knife-rain' && countdownTimer?.isActive == false){
        scoreSent = false;
        startTimer();
      }
        break;
      default:

    }


  }

  Future <bool> exitRequest() async{
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
                if(accumulated == 0 )
                {
                  Get.offAllNamed(DgRoutes
                      .gameHomeScreen);
                }else {
                  Get.offAllNamed(DgRoutes.authRoute(DgRoutes
                      .gamePlayGameOver), arguments: gameResult);
                }

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
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
                      URLRequest(url: Uri.parse(url)),
                      // initialUrlRequest:
                      // URLRequest(url: Uri.parse(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
                      // initialFile: "assets/index.html",
                      initialUserScripts: UnmodifiableListView<UserScript>([]),
                      initialOptions: options,
                      onWebViewCreated: (controller) async {
                        webViewController = controller;
                        webViewController?.addJavaScriptHandler(handlerName: 'handleResult', callback: (callback){
                            //check if message is game event
                            if(callback[0].runtimeType.toString() == '_InternalLinkedHashMap<String, dynamic>') {
                               //get the time to prevent multiple submission.
                              print("GETS HERE");

                              Map<String,
                                  dynamic> logMessage = callback[0] as Map<
                                  String,
                                  dynamic>;
                              // print(logMessage);
                              gameResult = GameResult.fromJson(logMessage);
                              gameResult.image = image;
                              gameResult.title = title;
                              processGameResult();
                            }
                        });
                      },
                      onLoadStart: (controller, url) async {
                        setState(() {
                          this.url = url.toString();
                          // infoSnack("URL", this.url);
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
                        // infoSnack("STOPPED","Error stopped");
                        await controller.evaluateJavascript(source: """
                           
                            window.addEventListener("message", (event) => {       
                             
                             window.flutter_inappwebview
                            .callHandler('handleResult',event.data);
                             
                            }, false);
                          """);
                        setState(() {
                          this.url = url.toString();
                        });
                      },
                      onLoadError: (controller, url, status, type) async {

                        // infoSnack("LOAD ERROR", "$url   \n type: $type       \n Status$status");
                      },
                      // onReceivedError: (controller, request, error) {
                      //   pullToRefreshController?.endRefreshing();
                      // },
                      onProgressChanged: (controller, progress) {
                        setState(() {
                          this.progress = progress / 100;
                        });
                      },

                      onUpdateVisitedHistory: (controller, url, isReload) {
                        setState(() {
                          this.url = url.toString();
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        debugPrint(consoleMessage.toString());
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress,color: AppColors.primary,)
                        : Container(),
                    Align(
                      alignment: Alignment(-1,-0.8),
                      child: CustomIconButton(
                      height: 50,
                      width: 50,
                      onTap: () => exitRequest(),
                      padding: IconButtonPadding.PaddingAll0,
                      child: const Icon(
                        DgIcons.cancel_circle,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),),

                  ],
                ),
              ),
            ])),
      ),
        onWillPop: ()=>exitRequest());
  }
}

