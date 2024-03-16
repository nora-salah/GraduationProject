import 'package:pill_detection/models/profile_model.dart';

class ProfileState {}

final class UpdateProfileInitial extends ProfileState {}

final class UpdateProfileLoadingState extends ProfileState {}

final class UpdateProfileErroringState extends ProfileState {
  final String errorMessage;

  UpdateProfileErroringState({required this.errorMessage});
}

final class UpdateProfileSuccessState extends ProfileState {}

final class ChangeImageUpdateProfile extends ProfileState {}

final class ChangeConfirmPasswordSuffixIcon extends ProfileState {}

//MyProfile

final class GetUserLoading extends ProfileState {}

final class GetUserSuccess extends ProfileState {
  final ProfileModel user;

  GetUserSuccess({required this.user});
}

final class GetUserFailure extends ProfileState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
