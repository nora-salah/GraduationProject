import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/navigate.dart';
import '../../../../../../core/widgets/custom_container.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160.h,
              width: 430.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                ),
                color: AppColors.primaryLight,
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            CustomContainer(
              img: AppAssets.pi1,
              btnText: AppStrings.start,
              text: AppStrings.pill,
              text2: AppStrings.detection,
              onPressed: () {
                customNavigate(context, "/pillDetectionService");
              },
            ),
            const SizedBox(
              height: 35,
            ),
            CustomContainer(
              btnText: AppStrings.start,
              img: AppAssets.pi2,
              text: AppStrings.pill,
              text2: AppStrings.interaction,
              onPressed: () {
                customNavigate(context, "/pillInteraction");
              },
            ),
            const SizedBox(
              height: 35,
            ),
            CustomContainer1(
              text: AppStrings.viewBlogs,
              text2: AppStrings.blogsOfPills,
              img: AppAssets.pi3,
              onPressed: () {
                customNavigate(context, "/homeScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
