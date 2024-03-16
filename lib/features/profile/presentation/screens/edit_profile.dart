import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/utils/app_strings.dart';
import 'package:pill_detection/core/utils/navigate.dart';
import 'package:pill_detection/core/widgets/custom_button.dart';
import 'package:pill_detection/core/widgets/custom_text_field.dart';
import 'package:pill_detection/core/widgets/custom_toast.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_state.dart';

import '../../../../core/widgets/custom_pick_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccessState) {
            showTwist(
                state: ToastStates.success,
                messege: AppStrings.updateProfileSucess);
            customNavigate(context, "/profileScreen");
          } else if (state is UpdateProfileErroringState) {
            showTwist(
                state: ToastStates.error, messege: AppStrings.updateFailed);
          }
        },
        builder: (context, state) {
          return Form(
            key: BlocProvider.of<ProfileCubit>(context).updateProfileKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
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
                  SizedBox(
                    height: 20.h,
                  ),
                  /*Center(
                    child: Text(
                      AppStrings.username,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),*/
                  SizedBox(
                    height: 60.h,
                  ),
                  //name
                  CustomTextFormField(
                    controller:
                        BlocProvider.of<ProfileCubit>(context).nameController,
                    icon2: Icons.person_outline,
                    hint: AppStrings.name,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //phone
                  CustomTextFormField(
                    controller:
                        BlocProvider.of<ProfileCubit>(context).emailController,
                    icon2: Icons.email,
                    hint: AppStrings.email,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ProfileCubit>(context)
                        .passwordController,
                    icon2: Icons.lock,
                    hint: AppStrings.password,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    controller: BlocProvider.of<ProfileCubit>(context)
                        .confirmPasswordController,
                    icon2: Icons.lock,
                    hint: AppStrings.confirmPassword,
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  state is UpdateProfileLoadingState
                      ? const CircularProgressIndicator(
                          color: AppColors.primary,
                        )
                      : SizedBox(
                          height: 55.h,
                          width: 440.w,
                          child: CustomButton(
                              text: AppStrings.updateProfile,
                              onPressed: () {
                                context.read<ProfileCubit>().updateProfile();

                                //customNavigate(context, "/signUpScreen");
                              }),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

/*ListView(
        children: [
          const SizedBox(height: 16),
          //! Profile Picture
          PickImageWidget(),
          const SizedBox(height: 16),

          //! Name
          const ListTile(
            title: Text("Name"),
            leading: Icon(Icons.person),
          ),
          const SizedBox(height: 16),

          //! Email
          const ListTile(
            title: Text("Email"),
            leading: Icon(Icons.email),
          ),
          const SizedBox(height: 16),

          //! Phone number
          const ListTile(
            title: Text("phone number"),
            leading: Icon(Icons.phone),
          ),
          const SizedBox(height: 16),

          //! Address
          const ListTile(
            title: Text("Address"),
            leading: Icon(Icons.location_city),
          ),
          const SizedBox(height: 16),
        ],
      ),*/
