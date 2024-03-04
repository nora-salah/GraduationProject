import 'package:go_router/go_router.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_in/signin_screen.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_up/singnup_screen.dart';
import 'package:pill_detection/features/choose_option/home_screen.dart';
import 'package:pill_detection/features/choose_option/screens/docage_checker_screen.dart';
import 'package:pill_detection/features/choose_option/screens/dosage_checker.dart';
import 'package:pill_detection/features/choose_option/screens/more_info.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/inter_pill_image_scan.dart';
import 'package:pill_detection/features/choose_service/screens_service/screens/pill_detection_service.dart';
import 'package:pill_detection/features/choose_service/screens_service/screens/pill_interaction.dart';
import 'package:pill_detection/features/profile/presentation/screens/profile_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => ProfileScreen()),
  GoRoute(
      path: "/InterPillImageScan",
      builder: (context, state) => const InterPillImageScan()),
  GoRoute(
      path: "/signUpScreen", builder: (context, state) => const SignUpScreen()),
  GoRoute(
      path: "/signInScreen", builder: (context, state) => const SignInScreen()),
  GoRoute(
      path: "/dosageCheckerScreen",
      builder: (context, state) => DosageCheckerScreen()),
  GoRoute(
      path: "/dosageChecker",
      builder: (context, state) => const DosageChecker()),
  GoRoute(path: "/moreInfo", builder: (context, state) => const MoreInfo()),
  GoRoute(
      path: "/pillDetectionService",
      builder: (context, state) => PillDetectionService()),
  GoRoute(path: "/sideEffect", builder: (context, state) => const SideEffect()),
  GoRoute(path: "/homeScreen", builder: (context, state) => HomeScreen()),
  GoRoute(
      path: "/pillInteraction",
      builder: (context, state) => const PillInteraction()),
  GoRoute(
      path: "/profileScreen",
      builder: (context, state) => const ProfileScreen()),
]);

/*
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String chooseService = '/chooseService';
  static const String pillDetection = '/pillDetection';
  static const String pillInteraction = '/pillInteraction';
  static const String resPillInteraction = '/resPillInteraction';
  static const String resPillDetection = '/resPillDetection';
  static const String profile = '/profile';
  static const String dosageChecker = '/dosageChecker';

  static const String moreInfo = '/moreInfo';
  static const String home = '/home';
  static const String sideEffects = '/sideEffects';

 // static const String home = '/home';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
       default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('No Found Route'),
              ),
            ));
    }
  }
}
*/
