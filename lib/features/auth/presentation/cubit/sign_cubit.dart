import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_state.dart';
import 'package:pill_detection/models/sign_in_model.dart';
import 'package:pill_detection/repositories/user_repository.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit(this.userRepository) : super(SignInitial());

  final UserRepository userRepository;
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  //* Password text field
  TextEditingController signInPasswordController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeSignPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();
  bool isConfirmPasswordsShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordsShowing = !isConfirmPasswordsShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordsShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  SignInModel? user;

  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
      email: signInEmailController.text,
      password: signInPasswordController.text,
    );
    response.fold(
        (errorMessage) => emit(SignInError(errorMessage: errorMessage)),
        (sinInModel) => emit(SignInSuccess()));
  }

  signUp() async {
    emit(SignUpLoading());

    final response = await userRepository.signUp(
        name: nameController.text,
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
        confirmPassword: confirmPasswordController.text);
    response.fold(
        (errorMessage) => emit(SignUpError(errorMessage: errorMessage)),
        (sinUpModel) => emit(SignUpSuccess(message: sinUpModel.message)));
  }



}
/*try {
      emit(SignUpLoading());
      final response=await api.post(
          EndPoint.register,
          isFormData: true,
          data: {
        Apikeys.username:nameController.text,
        Apikeys.email:signUpEmailController.text,
        Apikeys.password:signUpPasswordController.text,
        Apikeys.confirmPassword:confirmPasswordController.text,
        //Apikeys.email:emailController.text,
      }
      );
      final signUpModel=SignUpModel.fromJson(response);
      CacheHelper().saveData(key: Apikeys.token, value: user!.token);
      emit(SignUpSuccess(message:signUpModel.message ));

    } on ServerException catch (e) {
      emit(SignUpError(errorMessage:e.errorModel.errorMessage));
    }*/
