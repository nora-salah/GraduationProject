import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/core/database/api/api_consumer.dart';
import 'package:pill_detection/core/database/api/end_point.dart';
import 'package:pill_detection/core/database/cache/cache_helper.dart';
import 'package:pill_detection/core/error/exception.dart';
import 'package:pill_detection/function/upload_image_to_api.dart';
import 'package:pill_detection/models/profile_model.dart';
import 'package:pill_detection/models/update_prof_model.dart';

class ProfileRepository {
  final ApiConsumer api;

  ProfileRepository({required this.api});

  Future<Either<String, dynamic>> updateProfile({
    required String name,
    required String password,
    required String email,
    required String confirmPassword,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoint.userPersonalInformation,
        isFormData: true,
        data: {
          Apikeys.name: name,
          Apikeys.password: password,
          Apikeys.email: email,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.profilePic: await uploadImageToAPI(profilePic),
        },
      );
      final user = UpdateProfileModel.fromJson(response);
      // final user=UpdateProfileModel.fromJson(response);
      //token deleted
      CacheHelper().saveData(key: Apikeys.Authorization, value: user.message);

      return Right(user);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, ProfileModel>> getUserProfile() async {
    try {
      final response = await api.get(EndPoint.profile);
      return Right(ProfileModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
/*    final response = await updateRepo.getUserProfile(profilePic: profilePic!);
*/
/* Future<Either<String, ProfileModel>> getUserProfile({
    required XFile profilePic,
  }) async {
    try {
      final String? authorization =
          CacheHelper().getData(key: Apikeys.Authorization);

      final response = await api.get(EndPoint.profile,

          // token: CacheHelper().getData(key: Apikeys.token),
          data: {
            Apikeys.profilePic: await uploadImageToAPI(profilePic),
          },
          queryParameters: {
            Apikeys.Authorization: authorization
          });
      print(" authorization:$authorization");

      final profileModel = ProfileModel.fromJson(response);
      print(" this is authorization:$authorization");
      return Right(profileModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }*/
