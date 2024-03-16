import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pill_detection/core/utils/app_colors.dart';
import 'package:pill_detection/core/widgets/custom_toast.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_state.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetUserFailure) {
              showTwist(state: ToastStates.error, messege: state.errMessage);
            }
          },
          builder: (context, state) {
            return state is GetUserLoading
                ? const CircularProgressIndicator(
                    color: AppColors.primary,
                  )
                : state is GetUserSuccess
                    ? ListView(
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

                          SizedBox(height: 40.h),
                          //! Profile Picture
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundImage:
                                      NetworkImage(state.user.profilePic),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          //! Name
                          ListTile(
                            title: Text(state.user.name),
                            leading: Icon(
                              Icons.person,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),

                          //! Email
                          ListTile(
                            title: Text(state.user.email),
                            leading: Icon(
                              Icons.email,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),

                          //! Phone number
                          ListTile(
                            title: Text(state.user.phone),
                            leading: Icon(
                              Icons.phone,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),

                          ListTile(
                            title: Text(state.user.id),
                            leading: Icon(
                              Icons.confirmation_num,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    : Container(
                        child: Text("failed"),
                      );
          },
        ),
      ),
    );
  }
}

/*ListView(
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

               SizedBox(height: 40.h),
              //! Profile Picture
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                ],
              ),
              const SizedBox(height: 16),

              //! Name
              const ListTile(
                title: Text(AppStrings.name),
                leading: Icon(Icons.person,color: AppColors.primary,),
              ),
              const SizedBox(height: 16),

              //! Email
              const ListTile(
                title: Text(AppStrings.email),
                leading: Icon(Icons.email,color: AppColors.primary,),
              ),
              const SizedBox(height: 16),

              //! Phone number
              const ListTile(
                title: Text(AppStrings.phone),
                leading: Icon(Icons.phone,color: AppColors.primary,),
              ),
              const SizedBox(height: 16),

              const ListTile(
                title: Text(AppStrings.id),
                leading: Icon(Icons.confirmation_num,color: AppColors.primary,),
              ),
              const SizedBox(height: 16),
            ],
          ),*/

/*ListView(
        children: [
          const SizedBox(height: 16),
          //! Profile Picture
 Stack(
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
            ),          const SizedBox(height: 16),

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
