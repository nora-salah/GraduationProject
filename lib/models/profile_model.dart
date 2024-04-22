import 'package:pill_detection/core/database/api/end_point.dart';

class ProfileModel {
  final String email;
  final String password;
  final String name;
  final String profilePic;
  final String id;

  ProfileModel({
    required this.profilePic,
    required this.email,
    required this.password,
    required this.name,
    required this.id,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      profilePic: jsonData['user'][Apikeys.profilePic],
      email: jsonData['user'][Apikeys.email],
      password: jsonData['user'][Apikeys.password],
      name: jsonData['user'][Apikeys.name],
      id: jsonData['user'][Apikeys.id].toString(),
    );
  }
}
