import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';

import '../../../../../../core/utils/navigate.dart';

class TypeInteraction extends StatelessWidget {
  const TypeInteraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.pillInteraction,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: CustomButton(
                text: AppStrings.interactionByText,
                onPressed: () {
                  customNavigate(context, "/pillInteractionByText");
                }),
          ),
          SizedBox(
            height: 80.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: CustomButton(
                text: AppStrings.interactionByImage,
                onPressed: () {
                  customNavigate(context, "/pillInteractionByImage");
                }),
          ),
        ],
      ),
    );
  }
}
