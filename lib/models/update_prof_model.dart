import 'package:pill_detection/core/database/api/end_point.dart';

class UpdateProfileModel {
  final String message;
  final String email;
  final String password;
  final String name;
  final String profilePic;

//  final String confirm_password;

  UpdateProfileModel({
    required this.message,
    required this.email,
    required this.password,
    required this.name,
    required this.profilePic,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateProfileModel(
      message: jsonData[Apikeys.success],
      profilePic: jsonData['user'][Apikeys.profilePic],
      email: jsonData['user'][Apikeys.email],
      password: jsonData['user'][Apikeys.password],
      name: jsonData['user'][Apikeys.name],
    );
  }
}
/*

  //final String message;
 // final String token;

  UpdateProfileModel({required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
    required this.id,
   // required this.message,
    //required this.token,

  });

  factory UpdateProfileModel.fromJson(Map<String,dynamic> jsonData){
    return UpdateProfileModel(
      //message: [Apikeys.message],
      //token: [Apikeys.token],,
      profilePic: jsonData['user'][Apikeys.profilePic],
      email: jsonData['user'][Apikeys.email],
      phone: jsonData['user'][Apikeys.phone],
      name: jsonData['user'][Apikeys.name],
      id: jsonData['user'][Apikeys.name],
    );
  }
}
*/
