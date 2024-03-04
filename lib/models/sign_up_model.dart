import 'package:pill_detection/core/database/api/end_point.dart';

class SignUpModel{

  final String message;
  final String token;

  SignUpModel({required this.message, required this.token});

  factory SignUpModel.fromJson(Map<String,dynamic> jsonData){
    return SignUpModel(message: jsonData[Apikeys.message],
        token:jsonData[Apikeys.token] );
  }
}
