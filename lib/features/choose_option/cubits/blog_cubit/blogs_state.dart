abstract class BlogsState {}

class BlogsInitial extends BlogsState {}

class GetAllBlogsSuccess extends BlogsState {}

class GetAllBlogsFailure extends BlogsState {
  final String errorMessage;

  GetAllBlogsFailure({required this.errorMessage});
}

class GetAllBlogsLoading extends BlogsState {}
//class BlogsInitial extends BlogsState {}
