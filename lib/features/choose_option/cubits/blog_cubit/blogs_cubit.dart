import 'package:bloc/bloc.dart';
import 'package:pill_detection/features/auth/presentation/cubit/blogs_state.dart';

class BlogsCubit extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogsInitial());
}
