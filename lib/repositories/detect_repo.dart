import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pill_detection/function/upload_image_to_api.dart';
import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';
import '../models/detect_models/detect_opttions_model.dart';
import '../models/detect_models/pill_detect_model.dart';

class DetectRepo {
  final ApiConsumer api;

  DetectRepo({required this.api});
  Future<Either<String, PillDetectModel>> uploadImage(
      {required XFile image}) async {
    try {
      final response = await api.post(EndPoint.getDetectionData,
          data: {
            Apikeys.img: await uploadImageToAPI(image),
          },
          isFormData: true);
      return Right(PillDetectModel.fromJson(response));
      //return Right(PillDetectModel.fromJson(response.data['pillData']));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}

/*
  Future<Either<String, DosageDetectModel>> getDetectionDosageData(
      {required String id}) async {
    try {
      final response =
          await api.get(EndPoint.getDetectionData, queryParameters: {'id': id});
      return Right(DosageDetectModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);

    }
  }

  Future<Either<String, SideEffectDetectModel>> getDetectionDSideEffect(
      {required String id}) async {
    try {
      final response =
          await api.get(EndPoint.getDetectionData, queryParameters: {'id': id});
      return Right(SideEffectDetectModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, ContraindicationModel>> getDetectionContraindiacations(
      {required String id}) async {
    try {
      final response =
          await api.get(EndPoint.getDetectionData, queryParameters: {'id': id});
      return Right(ContraindicationModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }*/
