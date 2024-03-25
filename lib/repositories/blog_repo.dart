/*import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pill_detection/models/blog_model.dart';

import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';

class BlogRepo {
  final ApiConsumer api;

  BlogRepo({required this.api});
  List<BlogModel> blogs = [];

  Future<Either<String, BlogModel>> getAllBlogs() async {
    try {
      final response = await api.get(EndPoint.getAllBlogs);
      var responseBody = jsonDecode(response.body);
      for (var item in responseBody) {
        blogs.add(BlogModel.fromJson(item));
      }
      return Right(BlogModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}*/
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pill_detection/models/blog_model.dart';

import '../core/database/api/api_consumer.dart';
import '../core/database/api/end_point.dart';
import '../core/error/exception.dart';

class BlogRepo {
  final ApiConsumer api;

  BlogRepo({required this.api});

  Future<Either<String, BlogModel>> getAllBlogs() async {
    try {
      final response = await api.get(EndPoint.getAllBlogs);

      return Right(BlogModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
