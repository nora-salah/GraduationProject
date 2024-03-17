/*import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_state.dart';

import '../../../../models/blog_model.dart';
import '../../../../repositories/blog_repo.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsInitial());
  TextEditingController searchController = TextEditingController();

  BlogRepo? blogRepo;
  List<BlogModel> blogs = [];

  void getAllBlogs() async {
    emit(GetAllBlogsLoading());
    final response = await blogRepo!.getAllBlogs();
    var responseBody = jsonDecode(response.body);
    for (var item in responseBody) {
      blogs.add(BlogModel.fromJson(item));
    }
    response.fold(
      (errMessage) => emit(GetAllBlogsFailure(errorMessage: errMessage)),
      (user) => emit(GetAllBlogsSuccess()),
    );
  }
}
*/
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_state.dart';

import '../../../../models/blog_model.dart';
import '../../../../repositories/blog_repo.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsInitial());
  TextEditingController searchController = TextEditingController();

  BlogRepo? blogRepo;
  List<BlogModel> blogs = [];

  void getAllBlogs() async {
    emit(GetAllBlogsLoading());
    final response = await blogRepo!.getAllBlogs();
    response.fold(
      (errMessage) {
        emit(GetAllBlogsFailure(errorMessage: errMessage));
      },
      (blogModel) {
        blogs.add(blogModel);
        emit(GetAllBlogsSuccess());
      },
    );
  }
}
