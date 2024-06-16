import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pill_detection/core/database/api/dio_consumer.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_cubit.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_cubit.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';
import 'package:pill_detection/repositories/history_repo.dart';
import 'package:pill_detection/repositories/interaction_repo.dart';
import 'package:pill_detection/repositories/pills_repo.dart';
import 'package:pill_detection/repositories/profile_repo.dart';
import 'package:pill_detection/repositories/user_repository.dart';

import '../../features/choose_option/cubits/home_cubit.dart';
import '../../repositories/blog_repo.dart';
import '../../repositories/detect_repo.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(
      () => SignCubit(UserRepository(api: DioConsumer(Dio()))));
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => InteractionCubit(
      PillsRepo(api: DioConsumer(Dio())),
      InteractionRepo(api: DioConsumer(Dio()))));

  sl.registerLazySingleton(() => BlogsCubit(BlogRepo(api: DioConsumer(Dio()))));
  sl.registerLazySingleton(
      () => HistoryCubit(HistoryRepo(api: DioConsumer(Dio()))));

  sl.registerLazySingleton(
      () => ProfileCubit(ProfileRepository(api: DioConsumer(Dio()))));
  sl.registerLazySingleton(
      () => DetectCubit(DetectRepo(api: DioConsumer(Dio()))));
  /*sl.registerLazySingleton(
      () => DetectOptionCubit(DetectOptionsRepo(api: DioConsumer(Dio()))));*/
  //           () => BlogsCubit(BlogRepo(api: DioConsumer(Dio()))));
}
