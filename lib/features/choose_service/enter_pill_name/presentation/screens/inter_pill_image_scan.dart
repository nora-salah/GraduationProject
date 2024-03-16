import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_text_button.dart';
import 'package:pill_detection/features/choose_service/enter_pill_name/data/image_picker_dialog.dart';

class InterPillImageScan extends StatelessWidget {
  const InterPillImageScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 380.h,
                width: 444.w,
                foregroundDecoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30),),
                    image: DecorationImage(
                      image: AssetImage(
                        AppAssets.pillss,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 140,left: 100),
                    child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ImagePackerDialog(
                                  cameraOnTap: () async {
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? photo = await picker.pickImage(
                                        source: ImageSource.camera);

                                    //Navigator.pop(context);
                                    // pickImage(ImageSource.camera).then((value) => menuCubit.changeImage(value));
                                  },
                                  galleryOnTap: () async {
                                    final ImagePicker picker = ImagePicker();

                                    final XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery);

                                    //Navigator.pop(context);
                                    //pickImage(ImageSource.gallery).then((value) => menuCubit.changeImage(value));
                                  },
                                ); /*ImagePackerDialog(
                              cameraOnTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera).then((value) => menuCubit.changeImage(value));
                              },
                              galleryOnTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery).then((value) => menuCubit.changeImage(value));
                              },
                            );*/
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
                          .copyWith(fontSize: 20, color: AppColors.white,fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppStrings.yourGallery,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 20, ),
              ), SizedBox(
                width: 50.w,
              ),

              CustomTextButton2(text: AppStrings.viewAll, onPressed: (){})

            ],
          ),
          const Column(children: [

          ],)
          /*CustomImages(
                imgPath: AppAssets.pillss,
              height: 445,
                width: double.infinity,
              ),*/
        ],
      ),
    );
  }
}
