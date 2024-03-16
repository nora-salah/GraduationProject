import 'package:pill_detection/core/database/api/end_point.dart';

class ErrorModel {
  //final int status;
  final String errorMessage;
//required this.status,
  ErrorModel({ required this.errorMessage});
  factory ErrorModel.fromJson(Map<String,dynamic> jsonData) {
    return ErrorModel(
      //status: jsonData[Apikeys.status],
      errorMessage: jsonData[Apikeys.message],
    );
  }
}

  // {"status":400,"ErrorMessage":"invalid login information"}