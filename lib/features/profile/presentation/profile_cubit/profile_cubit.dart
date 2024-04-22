import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_state.dart';
import 'package:pill_detection/models/profile_model.dart';
import 'package:pill_detection/models/update_prof_model.dart';
import 'package:pill_detection/repositories/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.updateRepo,
  ) : super(UpdateProfileInitial());
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  final ProfileRepository updateRepo;
  // XFile? image;
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  XFile? profilePic;

  UpdateProfileModel? updateProfileModel;
  updateProfile() async {
    emit(UpdateProfileLoadingState());
    final result = await updateRepo.updateProfile(
        name: nameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        email: emailController.text,
        profilePic: profilePic!);
    emit(UpdateProfileSuccessState());
    result.fold(
      (errorMessage) =>
          emit(UpdateProfileErroringState(errorMessage: errorMessage)),
      (updateProfile) => emit(UpdateProfileSuccessState()),
    );

  }

  void changeImageUpdateProfile(XFile value) {
    profilePic = value;
    emit(ChangeImageUpdateProfile());
  }

  ProfileModel? user;

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await updateRepo.getUserProfile();

    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }
}
