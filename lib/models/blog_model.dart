import '../core/database/api/end_point.dart';

class BlogModel {
  final String title;
  final String photo;
  final String reference;
  final String content;

  BlogModel({
    required this.title,
    required this.photo,
    required this.content,
    required this.reference,
  });

  factory BlogModel.fromJson(Map<String, dynamic> jsonData) {
    return BlogModel(
      photo: jsonData[Apikeys.profilePic],
      title: jsonData[Apikeys.title],
      content: jsonData[Apikeys.content],
      reference: jsonData[Apikeys.reference],
    );
  }
}

