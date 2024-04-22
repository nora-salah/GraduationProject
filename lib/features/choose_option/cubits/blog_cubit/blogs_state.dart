import 'package:pill_detection/models/get_all_blogs_model.dart';

abstract class BlogsState {}

class BlogsInitial extends BlogsState {}

class GetAllBlogsSuccess extends BlogsState {
  final GetAllBlogsModel getAllBlogsModel;

  GetAllBlogsSuccess({required this.getAllBlogsModel});
}

class GetAllBlogsFailure extends BlogsState {
  final String errorMessage;

  GetAllBlogsFailure({required this.errorMessage});
}

class GetAllBlogsLoading extends BlogsState {}

class ChangeFilteredGroupState extends BlogsState {}
