import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_go_back.dart';
import '../../../../models/blog_model.dart';

class SpecificBlog extends StatelessWidget {
  const SpecificBlog({
    Key? key,
    required this.blogDetails,
  }) : super(key: key);

  final BlogModel blogDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
          ),
          CustomGoBack(onPressed: () {
            Navigator.pop(context);
          }),
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey,
                  offset: Offset(0, 7), // Set the offset
                  blurRadius: 3, // Set the blur radius
                  spreadRadius: 0.5, // Set the spread radius
                ),
              ],
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(blogDetails.photo),
                fit: BoxFit
                    .cover, // This will stretch the image to cover the whole area
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 460.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryLight,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      //
                      blogDetails.title,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      blogDetails.content,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
