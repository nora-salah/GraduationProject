import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/navigate.dart';
import '../../core/widgets/custom_button.dart';

class TypeHistory extends StatelessWidget {
  const TypeHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.pillHistory,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 370.w,
              height: 75.h,
              child: CustomButton(
                  text: AppStrings.pillDHistory,
                  onPressed: () {
                    customNavigate(context, "/AllOfDHistory");
                  }),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Center(
            child: SizedBox(
              width: 370.w,
              height: 75.h,
              child: CustomButton(
                  text: AppStrings.pillIHistory,
                  onPressed: () {
                    customNavigate(context, "/AllOfIHistory");
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
