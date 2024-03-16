import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/navigate.dart';
import 'package:pill_detection/core/widgets/custom_toast.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_state.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: BlocConsumer<SignCubit, SignState>(listener: (context, state) {
            if (state is SignUpSuccess) {
              showTwist(
                  state: ToastStates.success,
                  messege: AppStrings.signUpSucessfully);
              customNavigate(context, "/signInScreen");
            } else if (state is SignUpError) {
              showTwist(state: ToastStates.error, messege: state.errorMessage);
            }
          }, builder: (context, state) {
            return Form(
              key: BlocProvider.of<SignCubit>(context).signUpKey,
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
                    controller:
                        BlocProvider.of<SignCubit>(context).nameController,
                    label: AppStrings.username,
                    icon2: Icons.person,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignCubit>(context)
                        .signUpEmailController,
                    label: AppStrings.email,
                    icon2: Icons.email,
                    validate: (data) {
                      if (data!.isEmpty || !data.contains('@gmail.com')) {
                        return AppStrings.pleaseEnterValidEmail;
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignCubit>(context)
                        .signUpPasswordController,
                    passwordIsVisable: BlocProvider.of<SignCubit>(context)
                        .isLoginPasswordsShowing,
                    label: AppStrings.password,
                    validate: (data) {
                      if (data!.length < 8 || data.isEmpty) {
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
                    height: 30.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<SignCubit>(context)
                        .confirmPasswordController,
                    label: AppStrings.confirmPassword,
                    validate: (data) {
                      if (data!.length < 8 || data.isEmpty) {
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
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        AppStrings.iAgreeToThe,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      SizedBox(
                        width: 0.2.h,
                      ),
                      CustomTextButton(
                          text: AppStrings.privacyPolicy,
                          onPressed: () {
                            customNavigate(context, "/homeScreen");
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 55.h,
                    width: 330.w,
                    child: state is SignUpLoading
                        ? const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ))
                        : CustomButton(
                            text: AppStrings.createAccount,
                            onPressed: () {
                              context.read<SignCubit>().signUp();
                            }),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const OtherMethodToSign(
                    txt: AppStrings.orSignUpWith,
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  HaveAccount(
                    txt: AppStrings.alreadyHaveAccount,
                    txt2: AppStrings.signin,
                    onPressed: () {
                      customNavigate(context, "/signInScreen");
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
