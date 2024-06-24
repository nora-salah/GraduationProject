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
                SizedBox(
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
                  SizedBox(
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
      width: 370.w,
      height: 260.h,
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
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*CircleAvatar(
              backgroundColor: AppColors.white,
              backgroundImage: AssetImage(img),
              radius: 90,
            ),*/
            Container(
              width: 280.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.white, // Specify your border color here
                  width: 1.0, // Specify the border width
                ),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit
                      .cover, // This will stretch the image to cover the whole area
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              text,
              maxLines: 3,
              textAlign:
                  TextAlign.center, // Set the maximum number of lines to 2
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.normal, fontSize: 15),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
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
