import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
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

class CustomPillImage extends StatelessWidget {
  final String imageUrl;

  const CustomPillImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 400,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0, 7),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
