
 class ProfileState {}

class ProfileInitial extends ProfileState {}
/*
 final class GetUserSuccess extends ProfileState {
 final SignModel user;

 GetUserSuccess({required this.user});
 }
*/
 final class UploadProfilePic extends ProfileState {}

 final class GetUserLoading extends ProfileState {}
 final class GetUserSuccess extends ProfileState {}

 final class GetUserFailure extends ProfileState {
 final String errMessage;

 GetUserFailure({required this.errMessage});
 }