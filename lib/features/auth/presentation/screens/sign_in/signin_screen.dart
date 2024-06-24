import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pill_detection/core/widgets/custom_toast.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_state.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/navigate.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  // userController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: BlocConsumer<SignCubit, SignState>(
            listener: (context, state) {
              if (state is SignInSuccess) {
                showTwist(
                    state: ToastStates.success,
                    messege: AppStrings.signInSucessfully);
                customNavigate(context, "/homeScreen");
              } else if (state is SignInError) {
                showTwist(
                    state: ToastStates.error, messege: AppStrings.sinInFailed);
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<SignCubit>(context).signInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        AppStrings.signIn,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
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
                      height: 100.h,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<SignCubit>(context)
                          .signInEmailController,
                      label: AppStrings.email,
                      icon2: Icons.email,
                      validate: (data) {
                        if (data!.isEmpty || !data.contains('@gmail.com')) {
                          return AppStrings.pleaseEnterValidEmail;
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: BlocProvider.of<SignCubit>(context)
                          .signInPasswordController,
                      passwordIsVisable: BlocProvider.of<SignCubit>(context)
                          .isLoginPasswordsShowing,
                      label: AppStrings.password,
                      validate: (data) {
                        if (data!.length < 10 || data.isEmpty) {
                          return AppStrings.pleaseEnterValidPassword;
                        }

                        return null;
                      },
                      icon: BlocProvider.of<SignCubit>(context).suffixIcon,
                      suffixIconOnPressed: () {
                        BlocProvider.of<SignCubit>(context)
                            .changeLoginPasswordSuffixIcon();
                      },
                      icon2: Icons.lock,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppStrings.rememberMe,
                          style: Theme.of(context).textTheme.displaySmall,
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
                      height: 67.h,
                    ),
                    state is SignInLoading
                        ? Center(
                            child: const CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : SizedBox(
                            height: 55.h,
                            width: 330.w,
                            child: CustomButton(
                                text: AppStrings.login,
                                onPressed: () {
                                  context.read<SignCubit>().signIn();

                                  //customNavigate(context, "/signUpScreen");
                                  /*if (BlocProvider.of<SignCubit>(context)
                                .signKey
                                .currentState!
                                .validate()) {
                            BlocProvider.of<SignCubit>(context)
                                .login();*/
                                }),
                          ),
                    SizedBox(
                      height: 41.h,
                    ),
                    const OtherMethodToSign(
                      txt: AppStrings.orSignInWith,
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AppAssets.mail,
                          width: 50,
                          height: 45,
                        ),
                        SvgPicture.asset(
                          AppAssets.facebook,
                          width: 36.w,
                          height: 38.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    HaveAccount(
                      txt: AppStrings.dontHaveAnAccount,
                      txt2: AppStrings.signup,
                      onPressed: () {
                        customNavigate(context, "/signUpScreen");
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.txt,
    required this.txt2,
    required this.onPressed,
  });
  final String txt;
  final String txt2;
  final VoidCallback onPressed;

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
          onPressed: onPressed,
          /*() {
              customNavigate(context, "/signUpScreen");
            }*/
        ),
      ],
    );
  }
}

class OtherMethodToSign extends StatelessWidget {
  const OtherMethodToSign({
    super.key,
    required this.txt,
  });

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Divider(
          color: AppColors.black, // Set the color of the line
          thickness: 1.0, // Set the thickness of the line
        ),
        const Text(AppStrings.space),
        Text(
          txt,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const Divider(
          color: AppColors.black, // Set the color of the line
          thickness: 1.0, // Set the thickness of the line
        ),
        const Text(AppStrings.space),
      ],
    );
  }
}
