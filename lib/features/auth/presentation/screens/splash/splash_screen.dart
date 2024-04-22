import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pill_detection/core/utils/app_colors.dart';

import '../../../../../core/database/api/end_point.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      await sl<CacheHelper>().getData(
                key: Apikeys.Authorization,
              ) ==
              null
          ? customNavigate(context, "/signInScreen")
          : customNavigate(context, "/homeScreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                (FontAwesomeIcons.capsules),
                color: AppColors.white,
                size: 100,
              ),
              Text(AppStrings.DPill,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      // fontWeight: FontWeight.w400,
                      fontSize: 100,
                      color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
