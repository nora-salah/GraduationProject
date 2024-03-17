import '../core/database/api/end_point.dart';

class BlogModel {
  final String title;
  final String photo;
  final String reference;
  final String content;
  final String message;
  // final String token;

  BlogModel({
    required this.title,
    required this.photo,
    required this.content,
    required this.reference,
    required this.message,
    //required this.token,
  });

  factory BlogModel.fromJson(Map<String, dynamic> jsonData) {
    return BlogModel(
      message: jsonData[Apikeys.message],
      photo: jsonData['blogs'][Apikeys.profilePic] ?? '',
      title: jsonData['blogs'][Apikeys.title],
      content: jsonData['blogs'][Apikeys.content] ?? '',
      reference: jsonData['blogs'][Apikeys.reference],
    );
  }
}
