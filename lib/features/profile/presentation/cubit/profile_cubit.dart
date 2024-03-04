
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/features/profile/presentation/cubit/profile_state.dart';
import 'package:pill_detection/repositories/user_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepository) : super(ProfileInitial());
  XFile? profilePic;
  final UserRepository userRepository;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }
  profileModel() async {
    emit(GetUserLoading());

    final response = await userRepository.profileModel(profilePic: profilePic!);
    response.fold(
          (errorMessage) => emit(GetUserFailure(errMessage: errorMessage)),
          (user) => emit(GetUserSuccess()),
    );


  }
}
