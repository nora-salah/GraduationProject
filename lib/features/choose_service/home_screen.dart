import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/utils/navigate.dart';
import 'package:pill_detection/core/widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 160.h,
            width: 430.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 19,
          ),
          CustomContainer(
            text: AppStrings.pillDetection2,
            onPressed: () {
              customNavigate(context, "/pillInteraction");
            },
          ),
          SizedBox(
            height: 35,
          ),
          CustomContainer(
            text: AppStrings.pillInteraction2,
            onPressed: () {
              customNavigate(context, "/pillInteraction");
            },
          ),
          SizedBox(
            height: 35,
          ),
          CustomContainer(
            text: AppStrings.viewBlogs,
            onPressed: () {
              customNavigate(context, "/homeScreen");
            },
          ),
        ],
      ),
    );
  }
}
