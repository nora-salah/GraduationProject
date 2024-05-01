import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/data/image_picker_dialog.dart';
import 'package:pill_detection/function/upload_image_to_api.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_cubit.dart';

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
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ImagePackerDialog(
                        cameraOnTap: () async {
                          Navigator.pop(context);
                          pickImage(ImageSource.camera)
                              .then((value) => detectCubit.changeImage(value));
                        },
                        galleryOnTap: () async {
                          Navigator.pop(context);
                          pickImage(ImageSource.gallery)
                              .then((value) => detectCubit.changeImage(value));
                        },
                      );
                    });
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 100,
                color: AppColors.white,
              )),
          SizedBox(height: 30.h),
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
