import 'package:dartz/dartz.dart';
import 'package:pill_detection/models/history_interact_model.dart';

import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';
import '../models/detect_models/pill_detect_model.dart';
import '../models/history_D_model.dart';
import '../models/interact_model.dart';

class HistoryRepo {
  final ApiConsumer api;

  HistoryRepo({required this.api});

  Future<Either<String, InteractionHistoryModel>> getAllIHistory() async {
    try {
      final response = await api.get(
        EndPoint.getInteractionHistory,
      );

      return Right(InteractionHistoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, AllDetectionHistoryModel>> getAllDHistory() async {
    try {
      final response = await api.get(
        EndPoint.getDetectionHistory,
      );

      return Right(AllDetectionHistoryModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, PillDetectModel>> getSpecificDHistory({
    required int id,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getSpecificDetectionHistory(id),
      );
      return Right(PillDetectModel.fromJson(response));
      //return Right(PillDetectModel.fromJson(response.data['pillData']));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteDHistory({
    required int id,
  }) async {
    try {
      final response = await api.delete(
        EndPoint.deleteSpecificDetectionHistory(id),
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteIHistory({
    required int id,
  }) async {
    try {
      final response = await api.delete(
        EndPoint.deleteSpecificInteractionHistory(id),
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, DataModel>> getSpecificIHistory({
    required int id,
  }) async {
    try {
      final response = await api.get(
        EndPoint.getSpecificInteractionHistory(id),
      );
      return Right(DataModel.fromJson(response));
      //return Right(PillDetectModel.fromJson(response.data['pillData']));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
