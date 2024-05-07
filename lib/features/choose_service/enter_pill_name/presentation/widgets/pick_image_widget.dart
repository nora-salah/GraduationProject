import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/data/image_picker_dialog.dart';
import 'package:pill_detection/function/upload_image_to_api.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.detectCubit,
  });

  final DetectCubit detectCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        image: DecorationImage(
          image: const AssetImage(AppAssets.drug),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ImagePackerDialog(
                          cameraOnTap: () async {
                            Navigator.pop(context);
                            pickImage(ImageSource.camera).then(
                                (value) => detectCubit.changeImage(value));
                          },
                          galleryOnTap: () async {
                            Navigator.pop(context);
                            pickImage(ImageSource.gallery).then(
                                (value) => detectCubit.changeImage(value));
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
          SizedBox(height: 70.h),
          Text(
            AppStrings.detectPillWithYourCamera,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PickTwoImagesWidget extends StatelessWidget {
  const PickTwoImagesWidget({
    super.key,
    required this.interactionCubit,
  });

  final InteractionCubit interactionCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        image: DecorationImage(
          image: const AssetImage(AppAssets.drug),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ImagePackerDialog2(
                            cameraOnTap: () async {
                              Navigator.pop(context);
                              pickImage(ImageSource.camera).then((value) =>
                                  interactionCubit.changeImage(value));
                            },
                            galleryOnTap: () async {
                              Navigator.pop(context);
                              pickImage(ImageSource.gallery).then((value) =>
                                  interactionCubit.changeImage(value));
                            },
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.photo_camera_back_rounded,
                    size: 50,
                    color: AppColors.white,
                  )),
              SizedBox(height: 20.h),
              Text(
                AppStrings.pick1,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ImagePackerDialog2(
                            cameraOnTap: () async {
                              Navigator.pop(context);
                              pickImage(ImageSource.camera).then((value) =>
                                  interactionCubit.changeImage2(value));
                            },
                            galleryOnTap: () async {
                              Navigator.pop(context);
                              pickImage(ImageSource.gallery).then((value) =>
                                  interactionCubit.changeImage2(value));
                            },
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.photo_camera_back_rounded,
                    size: 50,
                    color: AppColors.white,
                  )),
              SizedBox(height: 20.h),
              Text(
                AppStrings.pick2,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
