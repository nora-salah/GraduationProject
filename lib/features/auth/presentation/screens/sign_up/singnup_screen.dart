import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../sign_in/signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                AppStrings.signUp,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                    ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.createAccount,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              height: 96.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.username,
              icon2: Icons.person,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.email,
              icon2: Icons.email,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.password,
              icon: Icons.remove_red_eye_outlined,
              icon2: Icons.lock,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              label: AppStrings.confirmPassword,
              icon: Icons.remove_red_eye_outlined,
              icon2: Icons.lock,
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Text(
                  AppStrings.iAgreeToThe,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(
                  width: 0.2.h,
                ),
                CustomTextButton(
                    text: AppStrings.privacyPolicy,
                    onPressed: () {
                      // customNavigate(context, "/signUpScreen");
                    }),

              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 55.h,
              width: 330.w,
              child: CustomButton(
                  text: AppStrings.createAccount, onPressed: () {}),
            ),
            SizedBox(
              height: 16.h,
            ),
            OtherMethodToSign(
              txt: AppStrings.orSignUpWith,
            ),
            SizedBox(
              height: 26.h,
            ),
            HaveAccount(
                txt: AppStrings.alreadyHaveAccount, txt2: AppStrings.signin),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
