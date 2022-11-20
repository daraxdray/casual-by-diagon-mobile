
import 'package:casual/screens/onboarding/splash_diagon.dart';

import '../../screens/active_game_play_screen/index.dart';
import '../../screens/game_over_dialog/index.dart';
import '../../screens/game_rules/index.dart';
import '../../screens/game_start_screen_screen/index.dart';
import '../../screens/home/home.dart';
import '../../screens/profile/index.dart';
import '../middleware/auth_gaurd.dart';
import './../../screens/auth/add_username/add_username_screen.dart';
import './../../screens/auth/create_profile_screen/create_profile_screen.dart';
import './../../screens/auth/login/login_screen.dart';
import './../../screens/auth/sign_up_two_screen/sign_up_two_screen.dart';
import 'package:casual/screens/onboarding/welcome.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../screens/onboarding/splash.dart';
import '../../screens/select_avatar_screen/index.dart';
import './../../screens/auth/verify_email_screen/verify_email_screen.dart';


class DgRoutes {
 static String welcomeScreenOneScreen = '/welcome_screen_one_screen';
static String welcomeScreenTwoScreen = '/welcome_screen_two_screen';
static String tournamentScreen = '/tournament_screen';
static String lotteryScreen = '/lottery_screen';
static String referralScreen = '/referral_screen';
static String referralCodeScreen = '/referral_code_screen';
static String refillScreen = '/refill_screen';
static String refillScreenOneScreen = '/refill_screen_one_screen';
static String allScreenNavigation = '/all-navigation';
 static String airtimeRefillScreen = '/airtime_refill_screen';
 static String shoppingCartScreen = '/shopping_cart_screen';
 static String shoppingCartTwoScreen = '/shopping_cart_two_screen';
 static String shoppingCartOneScreen = '/shopping_cart_one_screen';
 static String transactionHistoryScreen = '/transaction_history_screen';
 static String shopScreen = '/shop_screen';
 static String shopSearchScreen = '/shop_search_screen';
 static String shopSearchTwoScreen = '/shop_search_two_screen';
 static String shopSearchThreeScreen = '/shop_search_three_screen';
static String auth = '/auth';
static String updateScreen = '/update_screen';
static String signUpScreen = '/sign-up';
static String createProfile = '/create-profile';
static String addUsername = '/add-username';
static String initialRoute = '/';
static String startPage = '/start-page';
static String logInScreen = '/login';
static String selectAvatarScreen = '/select_avatar_screen';
static String gameHomeScreen = '/home';
static String pastActivityScreen = '/past_activity_screen';
static String walletScreen = '/wallet_screen';
static String nameEditingScreen = '/name_editing_screen';
static String gamePlayScreenRemarkScreen = '/game_play_screen_remark_screen';
static String gameRulesScreen = '/game_details_screen';
static String gamePlayGameOver = '/game_play_game_over';
static String profileSettingsScreen = '/profile_settings_screen';
static String leaderBoardScreen = '/leader_board_screen';
static String gameStart = '/game_play_screen_two';
static String gameRankingScreen = '/game_ranking_screen';
static String userProfileScreen = '/user_profile_screen';
static String activeGamePlayScreen = '/active_game_play';
static String noInternet = '/no-internet';
static String verifyEmail = '/verify-email';


static String authRoute(String route) => gameHomeScreen+route;

static List<GetPage> pages = [
 //
 GetPage(name:initialRoute,page: ()=> SplashScreen(), transition: Transition.leftToRight),
 GetPage(name:startPage, page: ()=> WelcomeView(),transition: Transition.upToDown),
 GetPage(name:logInScreen, page: ()=>LoginView(),transition: Transition.leftToRight,bindings: [LogInBinding()]),
 GetPage(name: createProfile, page: ()=>const CreateProfileView(),transition: Transition.leftToRight, bindings: [CreateProfileBinding()]),
 GetPage(name: addUsername, page: ()=>const AddUsernameView(),transition: Transition.leftToRight, bindings: [AddUsernameBinding()]),
 GetPage(name: signUpScreen, page: ()=>const SignupView(),transition: Transition.leftToRight, bindings: [SignUpTwoBinding()]),
 // GetPage(name:updateScreen, page: ()=> UpdateScreen(),transition: Transition.fadeIn, bindings: [UpdateBinding()]),
 GetPage(name:verifyEmail, page: ()=> OtpView(),transition: Transition.downToUp, bindings: [ VerifyEmailBinding()]),
 //
 GetPage(name:gameHomeScreen, page: ()=> HomeView(),transition: Transition.size,
     middlewares: [AuthGuard()],
     children: [
        GetPage(name:gameRulesScreen, page: ()=> RulesView(),transition: Transition.rightToLeft, bindings: [ GamePlayBinding()]),
        GetPage(name:userProfileScreen, page: ()=> const ProfileView(),transition: Transition.upToDown, bindings: [ UserProfileBinding()]),
        GetPage(name:profileSettingsScreen, page: ()=> ProfileSettingView(),transition: Transition.upToDown, bindings: [ ProfileSettingsBinding()]),
        GetPage(name:gameStart, page: ()=> GameStartScreen(),transition: Transition.rightToLeft, bindings: [ GameStartBinding()],),
        GetPage(name:activeGamePlayScreen, page: ()=>const  ActiveGamePlayScreen(),transition: Transition.rightToLeftWithFade, bindings:[ ActiveGamePlayBinding() ]),
        GetPage(name:gamePlayGameOver, page: ()=> GamePlayScreenGameOverDialog(),transition: Transition.rightToLeftWithFade,),
 //        GetPage(name:leaderBoardScreen, page: ()=> LeaderBoardScreen(),transition: Transition.rightToLeftWithFade, bindings: [ LeaderBoardBinding()]),
 //        GetPage(name:gamePlayScreenRemarkScreen, page: ()=> GamePlayScreenRemarkScreen(),transition: Transition.rightToLeftWithFade, bindings: [ GamePlayScreenRemarkBinding()]),
 //        GetPage(name:gameRankingScreen, page: ()=> GameRankingScreen(),transition: Transition.rightToLeftWithFade, bindings: [ GameRankingBinding()]),
 //        GetPage(name:nameEditingScreen, page: ()=> NameEditingScreen(),transition: Transition.rightToLeftWithFade, bindings: [ NameEditingBinding()]),
 //        GetPage(name:walletScreen, page: ()=> WalletScreen(),transition: Transition.rightToLeftWithFade, bindings: [ WalletBinding()]),
 //        GetPage(name:pastActivityScreen, page: ()=> PastActivityScreen(),transition: Transition.rightToLeftWithFade, bindings: [ PastActivityBinding()]),
 //        GetPage(name:refillScreen, page: ()=> RefillScreen(),transition: Transition.rightToLeftWithFade, bindings: [ RefillBinding()]),
 //        GetPage(name:noInternet, page: ()=> const NoInternetScreen(),transition: Transition.rightToLeftWithFade,),
 //      GetPage(name: transactionHistoryScreen,
 //       page: () => TransactionHistoryScreen(),bindings: [TransactionHistoryBinding(),],
 //      ),
 //
 //      GetPage(
 //       name: referralCodeScreen,
 //       page: () => ReferralCodeScreen(),
 //       bindings: [
 //        ReferralCodeBinding(),
 //       ],
 //      ),
 ]),
 //
 //
 GetPage(
  name: selectAvatarScreen,
  page: () => SelectAvatarScreen(),
  bindings: [
   SelectAvatarBinding(),
  ],
 ),
 //
 // GetPage(
 //  name: airtimeRefillScreen,
 //  page: () => AirtimeRefillScreen(),
 //  bindings: [
 //   AirtimeRefillBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: shoppingCartScreen,
 //  page: () => ShoppingCartScreen(),
 //  bindings: [
 //   ShoppingCartBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: shoppingCartOneScreen,
 //  page: () => ShoppingCartOneScreen(),
 //  bindings: [
 //   ShoppingCartOneBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: referralScreen,
 //  page: () => ReferralScreen(),
 //  bindings: [
 //   ReferralBinding(),
 //  ],
 // ),
 //
 // GetPage(
 //  name: shopScreen,
 //  page: () => ShopScreen(),
 //  bindings: [
 //   ShopBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: shopSearchScreen,
 //  page: () => ShopSearchScreen(),
 //  bindings: [
 //   ShopSearchBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: shopSearchTwoScreen,
 //  page: () => ShopSearchTwoScreen(),
 //  bindings: [
 //   ShopSearchTwoBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: shopSearchThreeScreen,
 //  page: () => ShopSearchThreeScreen(),
 //  bindings: [
 //   ShopSearchThreeBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: initialRoute,
 //  page: () => ReferralCodeScreen(),
 //  bindings: [
 //   ReferralCodeBinding(),
 //  ],
 // )

 // GetPage(
 //  name: welcomeScreenOneScreen,
 //  page: () => WelcomeScreenOneScreen(),
 //  bindings: [
 //   WelcomeScreenOneBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: gameHomeScreen,
 //  page: () => GameHomeScreen(),
 //  bindings: [
 //   GameHomeBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: gameRulesScreen,
 //  page: () => gameRulesScreen(),
 //  bindings: [
 //   GamePlayBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: gameStartScreen,
 //  page: () => gameStartScreen(),
 //  bindings: [
 //   gameStartBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: gameRankingScreen,
 //  page: () => GameRankingScreen(),
 //  bindings: [
 //   GameRankingBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: userProfileScreen,
 //  page: () => UserProfileScreen(),
 //  bindings: [
 //   UserProfileBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: profileSettingsScreen,
 //  page: () => ProfileSettingsScreen(),
 //  bindings: [
 //   ProfileSettingsBinding(),
 //  ],
 // ),
 //
 // GetPage(
 //  name: welcomeScreenTwoScreen,
 //  page: () => WelcomeScreenTwoScreen(),
 //  bindings: [
 //   WelcomeScreenTwoBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: loginScreen,
 //  page: () => LoginScreen(),
 //  bindings: [
 //   LoginBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: logInScreen,
 //  page: () => LogInScreen(),
 //  bindings: [
 //   LogInBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: leaderBoardScreen,
 //  page: () => LeaderBoardScreen(),
 //  bindings: [
 //   LeaderBoardBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: tournamentScreen,
 //  page: () => TournamentScreen(),
 //  bindings: [
 //   TournamentBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: walletScreen,
 //  page: () => WalletScreen(),
 //  bindings: [
 //   WalletBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: pastActivityScreen,
 //  page: () => PastActivityScreen(),
 //  bindings: [
 //   PastActivityBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: signUpOneScreen,
 //  page: () => SignUpOneScreen(),
 //  bindings: [
 //   SignUpOneBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: signUpTwoScreen,
 //  page: () => SignUpTwoScreen(),
 //  bindings: [
 //   SignUpTwoBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: updateScreen,
 //  page: () => UpdateScreen(),
 //  bindings: [
 //   UpdateBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: lotteryScreen,
 //  page: () => LotteryScreen(),
 //  bindings: [
 //   LotteryBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: referralScreen,
 //  page: () => ReferralScreen(),
 //  bindings: [
 //   ReferralBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: referralCodeScreen,
 //  page: () => ReferralCodeScreen(),
 //  bindings: [
 //   ReferralCodeBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: gamePlayScreenRemarkScreen,
 //  page: () => GamePlayScreenRemarkScreen(),
 //  bindings: [
 //   GamePlayScreenRemarkBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: refillScreen,
 //  page: () => RefillScreen(),
 //  bindings: [
 //   RefillBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: refillScreenOneScreen,
 //  page: () => RefillScreenOneScreen(),
 //  bindings: [
 //   RefillScreenOneBinding(),
 //  ],
 // ),
 // GetPage(
 //  name: initialRoute,
 //  page: () => WelcomeScreenOneScreen(),
 //  bindings: [
 //   WelcomeScreenOneBinding(),
 //  ],
 // )
];
}
