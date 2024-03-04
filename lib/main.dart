import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pill_detection/features/auth/presentation/cubit/sign_cubit.dart';
import 'package:pill_detection/features/profile/presentation/cubit/profile_cubit.dart';
import 'app/app.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await sl<CacheHelper>().init();
  //await CacheHelper().init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<SignCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ProfileCubit>(),
      ),
    ],
    child: const MyApp(),
  ));

}
/*
BlocProvider(
        create: (context) => sl<ForgetPasswordCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<HomeCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<MenuCubit>()..getAllMeals(),
      ),
      BlocProvider(
        create: (context) => sl<ProfileCubit>()..getChefData(),
      ),
      BlocProvider(
        create: (context) => sl<UpdateProfileCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<ChangePasswordCubit>(),
      ),
flutter:
     fonts:
       - family: RobotoMono
         fonts:
           - asset: fonts/RobotoMono-Regular.ttf
           - asset: fonts/RobotoMono-Bold.ttf
             weight: 700*/
