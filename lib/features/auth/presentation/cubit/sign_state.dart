
 import 'package:pill_detection/models/profile_model.dart';

class SignState {}

class SignInitial extends SignState {}
class ChangeSignPasswordSuffixIcon extends SignState {}
class ChangeConfirmPasswordSuffixIcon extends SignState {}

class SignInLoading extends SignState {}
class SignInSuccess extends SignState {}
class SignInError extends SignState {
 final String errorMessage;

  SignInError({required this.errorMessage});
}


 class SignUpLoading extends SignState {}
 class SignUpSuccess extends SignState {
  final String message;

  SignUpSuccess({required this.message});

 }
 class SignUpError extends SignState {
  final String errorMessage;

  SignUpError({required this.errorMessage});
 }

//class ChangeSignPasswordSuffixIcon extends SignState {}
//class ChangeSignPasswordSuffixIcon extends SignState {}


//class ChangeSignPasswordSuffixIcon extends SignState {}
