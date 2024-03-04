
import 'package:pill_detection/core/database/api/end_point.dart';

class ProfileModel{

  final String profilePic;

  ProfileModel({required this.profilePic,});

  factory ProfileModel.fromJson(Map<String,dynamic> jsonData){
    return ProfileModel(
      profilePic: jsonData['user'][Apikeys.profilePic],
    );
  }
}
