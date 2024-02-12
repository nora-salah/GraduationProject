import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/navigate.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_images.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  // userController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                AppStrings.signIn,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 40.sp,
                    ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.signInToYourAccount,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 146.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.username,
              icon2: Icons.person,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.password,
              icon: Icons.remove_red_eye_outlined,
              icon2: Icons.lock,
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              children: [
                Text(
                  AppStrings.rememberMe,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  width: 75.w,
                ),
                Text(
                  AppStrings.forgetPassword,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(decoration: TextDecoration.underline),
                )
              ],
            ),
            SizedBox(
              height: 87.h,
            ),
            SizedBox(
              height: 55.h,
              width: 330.w,
              child: CustomButton(
                  text: AppStrings.login,
                  onPressed: () {
                    customNavigate(context, "/signInScreen");
                  }),
            ),
            SizedBox(
              height: 41.h,
            ),
            OtherMethodToSign(txt:  AppStrings.orSignInWith,),
            SizedBox(
              height: 42.h,
            ),
            Row(
              children: [

                SizedBox(
                  width: 59.h,
                ),
                Container(
                  height: 36,
                  width: 38,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                    color: AppColors.blue,
                    iconSize: 36.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            HaveAccount(txt: AppStrings.dontHaveAnAccount,txt2: AppStrings.signup),
          ],
        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key, required this.txt, required this.txt2,
  });
  final String txt;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          txt,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        CustomTextButton(
            text: txt2,
            onPressed: () {
              customNavigate(context, "/signUpScreen");
            }),
      ],
    );
  }
}

class OtherMethodToSign extends StatelessWidget {
   OtherMethodToSign({
    super.key, required this.txt,
  });
final String txt;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          color: AppColors.black, // Set the color of the line
          thickness: 2.0, // Set the thickness of the line
        ),
        Text(AppStrings.space),
        Text(
         txt,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Divider(
          color: AppColors.black, // Set the color of the line
          thickness: 2.0, // Set the thickness of the line
        ),
        Text(AppStrings.space),
      ],
    );
  }
}
