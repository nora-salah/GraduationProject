import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/core/widgets/custom_icon_button.dart';
import 'package:pill_detection/core/widgets/custom_text_field.dart';

import '../../../../core/utils/app_strings.dart';

class PillInteraction extends StatelessWidget {
  const PillInteraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(37.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.pillInteraction,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 40,
                  ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              AppStrings.enterNameOfTwoTypes,
              style: Theme.of(context).textTheme.displaySmall,
            ),
             SizedBox(
              height: 91.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hint: AppStrings.onePill,

            ),
             SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hint: AppStrings.twoPill,
              pill: Container(
                width: 22.w,
                height: 22.h,
                child: Image(image: AssetImage(AppAssets.pills)),
              ),
            ),
             SizedBox(
              height: 45.h,
            ),
            Center(
              child: SizedBox(
                height: 55.h,
                width: 330.w,
                child:
              CustomButton(text: AppStrings.next, onPressed: (){}),),
            ),
          ],
        ),
      ),
    );
  }
}
