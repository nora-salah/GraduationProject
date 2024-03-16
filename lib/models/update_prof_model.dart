import 'package:pill_detection/core/database/api/end_point.dart';

class UpdateProfileModel {
  final String message;
  final String email;
  final String password;
  final String name;
  final String profilePic;
  final String id;
  final String updated;
  final String vEmail;
  final String created;
  final String phone;

//  final String confirm_password;

  UpdateProfileModel({
    required this.message,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.id,
    required this.created,
    required this.updated,
    required this.vEmail,
    required this.profilePic,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return UpdateProfileModel(
      message: jsonData[Apikeys.success],
      profilePic: jsonData['user'][Apikeys.profilePic],
      email: jsonData['user'][Apikeys.email],
      password: jsonData['user'][Apikeys.password],
      name: jsonData['user'][Apikeys.name],
      phone: jsonData['user'][Apikeys.phone],
      id: jsonData['user'][Apikeys.id],
      created: jsonData['user'][Apikeys.created],
      updated: jsonData['user'][Apikeys.updated],
      vEmail: jsonData['user'][Apikeys.vEmail],
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
