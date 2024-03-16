import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';

import '../../features/profile/presentation/profile_cubit/profile_cubit.dart';
import '../../features/profile/presentation/profile_cubit/profile_state.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return context.read<ProfileCubit>().profilePic == null
            ? Stack(
                children: [
                  Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage(AppAssets.pf),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.gallery)
                                .then((value) => context
                                    .read<ProfileCubit>()
                                    .changeImageUpdateProfile(value!));
                          },
                          child: const Icon(
                            Icons.camera_alt_sharp,
                            color: AppColors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: 170.0,
                    height: 170.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                          File(context.read<ProfileCubit>().profilePic!.path)),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
/*SizedBox(
          width: 130,
          height: 130,
          child: context.read<ProfileCubit>().profilePic == null
              ? CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage(AppAssets.profile),
            child: Stack(
              children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((value) => context
                              .read<ProfileCubit>()
                              .uploadProfilePic(value!));
                        },
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              : CircleAvatar(
            backgroundImage: FileImage(
                File(context.read<ProfileCubit>().profilePic!.path)),
          ),
        );*/
/* Stack(
              children: [
                Container(
                  width: 170.0,
                  height: 170.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(AppAssets.pf),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((value) => null);
                          /*context
                            .read<ProfileCubit>()
                            .uploadProfilePic(value!));*/
                        },
                        child: const Icon(
                          Icons.camera_alt_sharp,
                          color: AppColors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),*/
