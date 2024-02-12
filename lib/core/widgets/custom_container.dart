import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.text, required this.onPressed,

  }) : super(key: key);

  final String text;
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
      child: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              maxLines: 2,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 24,
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