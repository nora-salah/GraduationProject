import 'package:go_router/go_router.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_in/signin_screen.dart';
import 'package:pill_detection/features/auth/presentation/screens/sign_up/singnup_screen.dart';
import 'package:pill_detection/features/auth/presentation/screens/splash/splash_screen.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/home/home_screen.dart';
import 'package:pill_detection/features/choose_option/screens/more_info.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/inter_pill_image_scan.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction_by_text.dart';
import 'package:pill_detection/features/profile/presentation/screens/edit_profile.dart';
import 'package:pill_detection/features/profile/presentation/screens/my_profile.dart';
import 'package:pill_detection/features/profile/presentation/screens/profile_screen.dart';
import '../../features/choose_option/screens/blogs/blogs.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/home/home.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction_by_image.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/interaction/pill_interaction_result.dart';
import '../../features/choose_service/enter_pill_name/presentation/screens/interaction/type_interaction.dart';
import '../../features/history/history_of_detection/history_of_all_detection.dart';
import '../../features/history/history_of_interaction/history_of_all_interaction.dart';
import '../../models/detect_models/pill_detect_model.dart';

late final PillDetectModel detectDataModel;

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => SplashScreen()),
  GoRoute(
      path: "/typeInteraction",
      builder: (context, state) => const TypeInteraction()),
  GoRoute(path: "/blogs", builder: (context, state) => const Blogs()),
  GoRoute(path: "/specificBlog", builder: (context, state) => const Blogs()),
  GoRoute(
      path: "/pillInteractionByImage",
      builder: (context, state) => const PillInteractionByImage()),
  // GoRoute(path: "/specificBlog", builder: (context, state) => const PillInteraction()),

  GoRoute(
      path: "/InterPillImageScan",
      builder: (context, state) => const InterPillImageScan()),

  GoRoute(
      path: "/AllOfDHistory",
      builder: (context, state) => const AllOfDHistory()),

  /* GoRoute(
      path: "/pillInteractionRes",
      builder: (context, state) => PillInteractionRes()),*/
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
  GoRoute(path: "/home", builder: (context, state) => const Home()),
  GoRoute(
      path: "/pillInteractionByText",
      builder: (context, state) => const PillInteractionByText()),
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
