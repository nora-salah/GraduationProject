import 'package:pill_detection/core/database/api/end_point.dart';

class ErrorModel {
  final String errorMessage;
//
  ErrorModel({
    required this.errorMessage,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData[Apikeys.errorMessage],
    );
  }
}

// {"status":400,"ErrorMessage":"invalid login information"}
