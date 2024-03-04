import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/core/widgets/custom_pick_image.dart';
import 'package:pill_detection/core/widgets/custom_text_button.dart';
import 'package:pill_detection/core/widgets/custom_toast.dart';
import 'package:pill_detection/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:pill_detection/features/profile/presentation/cubit/profile_state.dart';

import '../../../../core/widgets/custom_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetUserSuccess) {
              showTwist(
                  state: ToastStates.success,
                  messege: AppStrings.signInSucessfully);
              // customNavigate(context, "/homeScreen");
            } else if (state is GetUserFailure) {
              showTwist(
                  state: ToastStates.error, messege: AppStrings.sinInFailed);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 30,
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 35,
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                PickImageWidget(),
                /* Center(
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(AppAssets.profile),
                // child: CustomImages(
                //   imgPath: AppAssets.profile,
                //   height: 160,
                //   width: 150,
                // ),
              ),*/

                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    AppStrings.username,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
            //! profile
            Row(
                  children: [
                    CustomButtonIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_outline),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      AppStrings.myProfile,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
            SizedBox(
              height: 8.h,
                ),
            //!history
            Row(
                  children: [
                    CustomButtonIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.history),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      AppStrings.history,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
            SizedBox(
              height: 8.h,
                ),
            //settings
            Row(
                  children: [
                    CustomButtonIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.settings_outlined),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      AppStrings.settings,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),

            SizedBox(
              height: 8.h,
                ),
            //!Notifications
            Row(
                  children: [
                    CustomButtonIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.notifications,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 20,
                              ),
                        ),
                        SizedBox(
                          width: 150.w,
                        ),
                        Icon(Icons.check_box_outline_blank),
                      ],
                    ),
                  ],
                ),

            SizedBox(
              height: 8.h,
                ),
            //!receiveMessages
            Row(
                  children: [
                    CustomButtonIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.message_outlined),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.receiveMessages,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 20,
                              ),
                        ),
                        SizedBox(
                          width: 94.w,
                        ),
                        Icon(Icons.check_box_outline_blank),
                      ],
                    ),
                    //check box??
                  ],
                ),
            SizedBox(
              height: 15.h,
                ),
            Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextButton2(
                        text: AppStrings.contactWithUs, onPressed: () {}),
                  ],
                ),

                state is GetUserLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                    text: AppStrings.profile,
                    onPressed: () {
                      context.read<ProfileCubit>().profileModel();
                    }),
                /*Text(

              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                  ),
            ),*/
                //check box??
              ],
            );
          },
        ),
      ),
    );
  }
}
