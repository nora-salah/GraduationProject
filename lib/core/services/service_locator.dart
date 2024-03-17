import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pill_detection/core/database/api/dio_consumer.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_cubit.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:pill_detection/repositories/profile_repo.dart';
import 'package:pill_detection/repositories/user_repository.dart';

import '../../features/choose_option/cubits/home_cubit.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(
      () => SignCubit(UserRepository(api: DioConsumer(Dio()))));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => BlogsCubit());
  sl.registerLazySingleton(
      () => ProfileCubit(ProfileRepository(api: DioConsumer(Dio()))));
  //           () => BlogsCubit(BlogRepo(api: DioConsumer(Dio()))));
}
