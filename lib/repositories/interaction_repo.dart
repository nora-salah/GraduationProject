import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';
import '../function/upload_image_to_api.dart';
import '../models/interact_model.dart';

class InteractionRepo {
  final ApiConsumer api;

  InteractionRepo({required this.api});

  Future<Either<String, AllData>> getInteraction(
      {required String pill1, required String pill2}) async {
    try {
      final response = await api.get(EndPoint.getInteractions,
          queryParameters: {
            'pillName_1': pill1,
            'pillName_2': pill2,
          }
    );
      return Right(AllData.fromJson(response));
      //return Right(PillDetectModel.fromJson(response.data['pillData']));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, AllData>> uploadTwoImages({
    required XFile image1,
    required XFile image2,
  }) async {
    try {
      final response = await api.post(EndPoint.getImageInteraction,
          data: {
            Apikeys.img1: await uploadImageToAPI(image1),
            Apikeys.img2: await uploadImageToAPI(image2),
          },
          isFormData: true);
      return Right(AllData.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
