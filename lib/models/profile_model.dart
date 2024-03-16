import 'package:pill_detection/core/database/api/end_point.dart';

class ProfileModel {
  final String email;
  final String phone;
  final String name;
  final String profilePic;
  final String id;
  //final String message;
  // final String token;

  ProfileModel({
    required this.profilePic,
    required this.email,
    required this.phone,
    required this.name,
    required this.id,
    // required this.message,
    //required this.token,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      //message: [Apikeys.message],
      //token: [Apikeys.token],,
      profilePic: jsonData['user'][Apikeys.profilePic] ?? '',
      email: jsonData['user'][Apikeys.email],
      phone: jsonData['user'][Apikeys.phone] ?? '',
      name: jsonData['user'][Apikeys.name],
      id: jsonData['user'][Apikeys.id].toString(),
    );
  }
}
