import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/utils/navigate.dart';
import 'package:pill_detection/core/widgets/custom_container.dart';
import 'package:pill_detection/core/widgets/custom_google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  int currenIndex = 0;

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
            const SizedBox(
              height: 19,
            ),
            CustomContainer(
              img: AppAssets.pi1,
              text: AppStrings.pill,
              text2: AppStrings.detection,

              onPressed: () {
                customNavigate(context, "/pillInteraction");
              },
            ),
            const SizedBox(
              height: 35,
            ),
            CustomContainer(
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
            CustomGNav(currentIndex: currenIndex,
              onChanged: (value){},
              tabs:  [
                GButton(icon: Icons.home,text: AppStrings.home,),
               GButton(icon: Icons.person,text: AppStrings.profile),
            ],)
          ],
        ),
      ),

    );
  }
}
