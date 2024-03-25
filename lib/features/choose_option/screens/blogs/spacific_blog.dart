import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_container.dart';
import '../../../../core/widgets/custom_go_back.dart';
import '../../../../models/blog_model.dart';
import '../side_effect.dart';

class SpecificBlog extends StatelessWidget {
  SpecificBlog({Key? key}) : super(key: key);
  //BlogModel? model;
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
            customNavigate(context, "/blogs");
          }),
          Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey,
                    offset: Offset(0, 7), // Set the offset
                    blurRadius: 3, // Set the blur radius
                    spreadRadius: 0.5, // Set the spread radius
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Image(
                image: AssetImage(AppAssets.pills),
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  //
                  "text1!",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  //
                  ",ktext2!lllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllldsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdssss;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdslllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllll;jdsssssssdjklllllllllssssssdjkllllllllllllllllllll;jdsssssssdjkllllllllllllllllllllllllllllllllllllllllllllllllllll",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
