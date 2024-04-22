import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/core/widgets/custom_file_image.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/data/image_picker_dialog.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/presentation/screens/detection/pill_detection_service.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_state.dart';

import '../../../../../core/widgets/custom_toast.dart';
import '../../../../../function/upload_image_to_api.dart';
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
        return Form(
          key: BlocProvider.of<DetectCubit>(context).uploadKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 380.h,
                    width: 444.w,
                    foregroundDecoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.6),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          AppAssets.drug,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 140, left: 100),
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ImagePackerDialog(
                                      cameraOnTap: () async {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.camera).then(
                                            (value) =>
                                                detectCubit.changeImage(value));
                                      },
                                      galleryOnTap: () async {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery).then(
                                            (value) =>
                                                detectCubit.changeImage(value));
                                      },
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 100,
                              color: AppColors.white,
                            )),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Align(
                        child: Text(
                          AppStrings.detectPillWithYourCamera,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomFileImage(image: detectCubit.image),
              SizedBox(
                height: 30.h,
              ),
              state is DetectLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: CustomButton(
                                  text: AppStrings.uploadImage,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PillDetectionService(
                                                  detectDataModel: BlocProvider
                                                          .of<DetectCubit>(
                                                              context)
                                                      .uploadImageAndGetData(),
                                                )));
                                    /*customNavigate(
                                        context, '/pillDetectionService');*/
                                  })),
                        )
                      ],
                    )
            ],
          ),
        );
      }),
    );
  }
}
