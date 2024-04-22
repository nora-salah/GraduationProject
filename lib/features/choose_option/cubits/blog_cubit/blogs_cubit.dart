import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pill_detection/core/database/api/end_point.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_state.dart';

import '../../../../models/blog_model.dart';
import '../../../../repositories/blog_repo.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit(this.blogRepo) : super(BlogsInitial());
  TextEditingController searchController = TextEditingController();
  List<BlogModel> allBlogs = [];
  BlogRepo? blogRepo;

  void getAllBlogs() async {
    emit(GetAllBlogsLoading());
    final response = await blogRepo!.getAllBlogs();
    response.fold(
      (errMessage) {
        emit(GetAllBlogsFailure(errorMessage: errMessage));
      },
      (getAllBlogsModel) {
        allBlogs = getAllBlogsModel.blogs;
        emit(GetAllBlogsSuccess(getAllBlogsModel: getAllBlogsModel));
      },
    );
  }

  late List filteredBlogsSearchList = allBlogs;

  void filteredSearch(String value) {
    if (value.isEmpty) {
      filteredBlogsSearchList = allBlogs;
    } else {
      filteredBlogsSearchList = allBlogs
          .where(
            (element) => element.title
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase()),
          )
          .toList();
    }
    emit(ChangeFilteredGroupState());
  }
}
