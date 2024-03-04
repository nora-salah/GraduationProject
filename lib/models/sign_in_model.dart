import 'package:pill_detection/core/database/api/end_point.dart';

class SignInModel{
final String message;
final String token;

SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String,dynamic> jsonData){
  return SignInModel(message: jsonData[Apikeys.message],token:jsonData[Apikeys.token] );
}
}