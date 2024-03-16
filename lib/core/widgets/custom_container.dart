import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.text,
    required this.onPressed,
    required this.btnText,
    required this.img,
    this.text2,
  });
  final String text;
  final String img;
  final String? text2;
  final String btnText;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 199.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            offset: Offset(0, 5), // Set the offset
            blurRadius: 6, // Set the blur radius
            spreadRadius: 1, // Set the spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(img),
            radius: 90,
          ),

          ///  Image.asset(img,width: 230.w,height: 500.h,),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  text2!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 132.w,
                  height: 32.h,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      btnText,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer1 extends StatelessWidget {
  const CustomContainer1({
    super.key,
    required this.text,
    required this.onPressed,
    required this.img,
    this.text2,
  });
  final String text;
  final String img;
  final String? text2;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 199.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            offset: Offset(0, 5), // Set the offset
            blurRadius: 6, // Set the blur radius
            spreadRadius: 1, // Set the spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(img),
            radius: 90,
          ),

          ///  Image.asset(img,width: 230.w,height: 500.h,),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 15.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    text2!,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    width: 132.w,
                    height: 32.h,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      child: Text(
                        AppStrings.start,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainerBlog extends StatelessWidget {
  const CustomContainerBlog({
    super.key,
    required this.text,
    required this.onPressed,
    required this.btnText,
    required this.img,
  });
  final String text;
  final String img;
  final String btnText;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            offset: Offset(0, 2), // Set the offset
            blurRadius: 3, // Set the blur radius
            spreadRadius: 1, // Set the spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(70),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            backgroundImage: AssetImage(img),
            radius: 90,
          ),

          ///  Image.asset(img,width: 230.w,height: 500.h,),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  width: 120.w,
                  height: 32.h,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      btnText,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  text2!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),



            //
            Text(
                  AppStrings.start,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 24),
                ),
*/
