import 'package:go_router/go_router.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_in/signin_screen.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_up/singnup_screen.dart';
import 'package:pill_detection/features/auth/presentation/screens/splash/splash_screen.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/home/home_screen.dart';
import 'package:pill_detection/features/choose_option/screens/dosage_checker.dart';
import 'package:pill_detection/features/choose_option/screens/more_info.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/inter_pill_image_scan.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/detection/pill_detection_service.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction.dart';
import 'package:pill_detection/features/profile/presentation/screens/edit_profile.dart';
import 'package:pill_detection/features/profile/presentation/screens/my_profile.dart';
import 'package:pill_detection/features/profile/presentation/screens/profile_screen.dart';
import '../../features/choose_option/screens/blogs/blogs.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/home/home.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction_result.dart';
import '../../models/detect_model.dart';

late final PillDetectModel detectDataModel;

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => SplashScreen()),
  GoRoute(path: "/blogs", builder: (context, state) => const Blogs()),
  GoRoute(path: "/specificBlog", builder: (context, state) => Blogs()),
  GoRoute(
      path: "/InterPillImageScan",
      builder: (context, state) => InterPillImageScan()),
  GoRoute(
      path: "/pillInteractionRes",
      builder: (context, state) => const PillInteractionRes()),
  GoRoute(
      path: "/signUpScreen", builder: (context, state) => const SignUpScreen()),
  GoRoute(
      path: "/signInScreen", builder: (context, state) => const SignInScreen()),
  GoRoute(path: "/moreInfo", builder: (context, state) => const MoreInfo()),
  /*GoRoute(
      path: "/pillDetectionService",
      builder: (context, state) => PillDetectionService(
          )),*/
  GoRoute(path: "/sideEffect", builder: (context, state) => const SideEffect()),
  GoRoute(path: "/homeScreen", builder: (context, state) => HomeScreen()),
  GoRoute(path: "/home", builder: (context, state) => Home()),
  GoRoute(
      path: "/pillInteraction", builder: (context, state) => PillInteraction()),
  GoRoute(
      path: "/profileScreen",
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: "/editProfileScreen",
      builder: (context, state) => const EditProfileScreen()),
  GoRoute(
      path: "/myProfileScreen",
      builder: (context, state) => const MyProfileScreen()),
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
