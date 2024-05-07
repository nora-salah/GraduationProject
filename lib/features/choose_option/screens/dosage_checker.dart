import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/features/choose_option/screens/side_effect.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/widgets/custom_go_back.dart';
import '../../../models/detect_models/detect_opttions_model.dart';

class DosageChecker extends StatelessWidget {
  const DosageChecker({
    Key? key,
    required this.detectDosageModel,
  }) : super(key: key);
  final DosageDetectModel? detectDosageModel;
  // final PillDetectModel? detectModel;

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
            customNavigate(context, "/pillDetectionService");
          }),
          SizedBox(
            height: 26.h,
          ),
          // CustomPillImage(imageUrl:detectModel!.photo),
          CustomPillService(
            text1: AppStrings.dosageChecker,
            text2: detectDosageModel!.dosage,
          ),
        ],
      ),
    );
  }
}
