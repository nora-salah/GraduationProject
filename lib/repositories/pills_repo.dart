import 'package:dartz/dartz.dart';
import 'package:pill_detection/models/pills_model.dart';

import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';

class PillsRepo {
  final ApiConsumer api;

  PillsRepo({required this.api});

  Future<Either<String, GetAllPillsModel>> getAllPills() async {
    try {
      final response = await api.get(
        EndPoint.getAllPillsInteraction,
      );

      return Right(GetAllPillsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
