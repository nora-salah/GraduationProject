import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          CustomGoBack(onPressed: () {
            customNavigate(context, "/pillDetectionService");
          }),
          SizedBox(
            height: 26.h,
          ),
          const CustomPillImage(imageUrl: AppAssets.pills),
          const CustomPillService(
            text1: AppStrings.moreAbout,
            text2: AppStrings.pillName,
          ),
        ],
      ),
    );
  }
}
