import 'package:flutter/material.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_service/enter_pill_image/screens/side_effect.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPillImage(),
          CustomPillService(
            text1: AppStrings.moreAbout,
            text2: AppStrings.pillName,
          ),
        ],
      ),
    );
  }
}
