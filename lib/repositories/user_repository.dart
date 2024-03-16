import 'package:dartz/dartz.dart';
import 'package:pill_detection/core/database/api/api_consumer.dart';
import 'package:pill_detection/core/database/api/end_point.dart';
import 'package:pill_detection/core/database/cache/cache_helper.dart';
import 'package:pill_detection/core/error/exception.dart';
import 'package:pill_detection/models/sign_in_model.dart';
import 'package:pill_detection/models/sign_up_model.dart';

class UserRepository {
  final ApiConsumer api;

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(EndPoint.login, data: {
        Apikeys.email: email,
        Apikeys.password: password,
      });
      final user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: Apikeys.Authorization, value: user!.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(
        EndPoint.register,
        isFormData: true,
        data: {
          Apikeys.name: name,
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
        },
      );
      final signUPModel = SignUpModel.fromJson(response);

      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
