import 'package:flutter/material.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
class DosageChecker extends StatelessWidget {
  const DosageChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPillImage(),

          CustomPillService(text1:AppStrings.dosageChecker, text2: AppStrings.pillName,),
        ],
      ),

    );
  }
}
