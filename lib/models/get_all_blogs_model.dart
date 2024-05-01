import 'package:pill_detection/models/blog_model.dart';

import '../core/database/api/end_point.dart';

class GetAllBlogsModel {
  final String message;
  final List<BlogModel> blogs;

  GetAllBlogsModel({required this.message, required this.blogs});

  factory GetAllBlogsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllBlogsModel(
      message: jsonData[Apikeys.message],
      blogs: (jsonData[Apikeys.blogs] as List<dynamic>)
          .map((e) => BlogModel.fromJson(e))
          .toList(),
    );
  }
}
