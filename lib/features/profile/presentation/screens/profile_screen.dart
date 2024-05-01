import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_assets.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/widgets/custom_go_back.dart';
import 'package:pill_detection/core/widgets/custom_text_button.dart';

import '../../../../core/utils/navigate.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomGoBack(
              onPressed: () {
                customNavigate(context, "/home");
              },
            ),
            SizedBox(
              height: 11.h,
            ),
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
                  onPressed: () {
                    customNavigate(context, "/myProfileScreen");
                  },
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
            Row(
              children: [
                CustomButtonIcon(
                  onPressed: () {
                    customNavigate(context, "/editProfileScreen");
                  },
                  icon: const Icon(Icons.edit),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  AppStrings.editProfile,
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
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    const Icon(Icons.check_box_outline_blank),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 8.h,
            ),
            /*
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
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextButton2(
                    text: AppStrings.contactWithUs, onPressed: () {}),
              ],
            ),

            /*Text(

              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                  ),
            ),*/
            //check box??
          ],
        ),
      ),
    );
  }
}

/*
*  state is GetUserLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                    text: AppStrings.profile,
                    onPressed: () {
                      context.read<ProfileCubit>().profileModel();
                    }),
* */
/*
* Container(
            width: 170.0,
            height: 170.0,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage:AssetImage(AppAssets.pf),

            ),
          ),

*/

/*child: BlocConsumer<ProfileCubit, ProfileState>(
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
            return*/
