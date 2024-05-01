import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_state.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../function/upload_image_to_api.dart';
import '../../../data/image_picker_dialog.dart';

class PillInteractionByImage extends StatelessWidget {
  const PillInteractionByImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InteractionCubit, InteractionState>(
          listener: (context, state) {},
          builder: (context, state) {
            final interactionCubit = BlocProvider.of<InteractionCubit>(context);

            return Form(
              key: interactionCubit.interactionKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomGoBack(onPressed: () {}),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 170.w,
                          height: 170.h,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary,
                                offset: Offset(0, 5), // Set the offset
                                blurRadius: 6, // Set the blur radius
                                spreadRadius: 1, // Set the spread radius
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ImagePackerDialog2(
                                        cameraOnTap: () async {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.camera).then(
                                              (value) => interactionCubit
                                                  .changeImage(value));
                                        },
                                        galleryOnTap: () async {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery).then(
                                              (value) => interactionCubit
                                                  .changeImage(value));
                                        },
                                      );
                                    });
                              },
                              child: Image.asset(AppAssets.pills)),
                        ),
                        Container(
                          width: 170.w,
                          height: 170.h,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary,
                                offset: Offset(0, 5), // Set the offset
                                blurRadius: 6, // Set the blur radius
                                spreadRadius: 1, // Set the spread radius
                              ),
                            ],
                          ),
                          child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ImagePackerDialog2(
                                        cameraOnTap: () async {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.camera).then(
                                              (value) => interactionCubit
                                                  .changeImage2(value));
                                        },
                                        galleryOnTap: () async {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery).then(
                                              (value) => interactionCubit
                                                  .changeImage2(value));
                                        },
                                      );
                                    });
                              },
                              child: Image.asset(AppAssets.pills)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
