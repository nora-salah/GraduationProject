import 'package:pill_detection/core/database/api/end_point.dart';

class SignUpModel{

  final String message;
  final String token;

  SignUpModel({required this.message, required this.token
  });

  factory SignUpModel.fromJson(Map<String,dynamic> jsonData){
    return SignUpModel(message: jsonData[Apikeys.message], token:jsonData[Apikeys.token]
        );
  }
}
/*
class SignUpModel {
  final String message;
  final Map<String, List<String>> errors;

  SignUpModel({required this.message, required this.errors});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        message: jsonData[Apikeys.message],
        errors: Map<String, List<String>>.from(jsonData['errors']).map(
                (key, value) => MapEntry<String, List<String>>(key, List<String>.from(value)),
            ),
        );
    }
}*/