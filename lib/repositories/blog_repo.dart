import 'package:dartz/dartz.dart';
import 'package:pill_detection/models/get_all_blogs_model.dart';
import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';

class BlogRepo {
  final ApiConsumer api;

  BlogRepo({required this.api});

  Future<Either<String, GetAllBlogsModel>> getAllBlogs() async {
    try {
      final response = await api.get(
        EndPoint.getAllBlogs,
      );

      return Right(GetAllBlogsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
