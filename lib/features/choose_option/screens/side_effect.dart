import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';

import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';

class SideEffect extends StatelessWidget {
  const SideEffect({Key? key}) : super(key: key);

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
          CustomPillImage(),
          const CustomPillService(
            text1: AppStrings.sideEffect,
            text2: AppStrings.pillName,
          ),
        ],
      ),
    );
  }
}

class CustomPillService extends StatelessWidget {
  const CustomPillService({
    super.key,
    this.text1,
    this.text2,
  });
  final String? text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            //
            text1!,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            //
            text2!,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class CustomPillImage extends StatelessWidget {
  const CustomPillImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: 400,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(0, 7), // Set the offset
              blurRadius: 5, // Set the blur radius
              spreadRadius: 1, // Set the spread radius
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: const Image(
          image: AssetImage(AppAssets.pills),
        ));
  }
}
