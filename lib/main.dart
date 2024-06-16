import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_detection/features/auth/presentation/cubit/bloc_observer.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/choose_option/cubits/blog_cubit/blogs_cubit.dart';
import 'package:pill_detection/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:pill_detection/presentation/cubits/detect_cubit/detect_cubit.dart';
import 'package:pill_detection/presentation/cubits/hitory_cubit/history_cubit.dart';
import 'package:pill_detection/presentation/cubits/interaction_cubit.dart';

import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';
import 'features/choose_option/cubits/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setup();
  await sl<CacheHelper>().init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<SignCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<HomeCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<InteractionCubit>()..getAllPills(),
      ),
      BlocProvider(
        create: (context) => sl<ProfileCubit>()..getUserProfile(),
      ),
      BlocProvider(
        create: (context) => sl<DetectCubit>()..uploadImageAndGetData(),
      ),
      BlocProvider(
        create: (context) => sl<BlogsCubit>()..getAllBlogs(),
      ),
      BlocProvider(
        create: (context) => sl<HistoryCubit>()..getAllDHistory(),
      ),
    ],
    child: const MyApp(),
  ));
}
