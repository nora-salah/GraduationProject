import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/core/widgets/custom_file_image.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/detection/pill_detection_service.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/widgets/pick_image_widget.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_state.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../../presentation/cubits/detect_cubit/detect_cubit.dart';

class InterPillImageScan extends StatelessWidget {
  const InterPillImageScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetectCubit, DetectState>(listener: (context, state) {
        if (state is DetectFailureState) {
          showTwist(state: ToastStates.error, messege: state.errorMessage);
        }
      }, builder: (context, state) {
        final detectCubit = BlocProvider.of<DetectCubit>(context);
        return Column(
          children: [
            //! Pick Image
            PickImageWidget(detectCubit: detectCubit),
            SizedBox(height: 30.h),
            //! Image
            CustomFileImage(image: detectCubit.image),
            SizedBox(height: 50.h),
            //! Upload Image
            SizedBox(
              width: 370.w,
              height: 50.h,
              child: CustomButton(
                text: AppStrings.uploadImage,
                onPressed: () {
                  if (BlocProvider.of<DetectCubit>(context).image != null) {
                    BlocProvider.of<DetectCubit>(context)
                        .uploadImageAndGetData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PillDetectionService(),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
