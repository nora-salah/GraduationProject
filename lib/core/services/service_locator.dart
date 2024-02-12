

import 'package:get_it/get_it.dart';

import '../database/cache/cache_helper.dart';

final sl=GetIt.instance;
void setup(){
  sl.registerSingleton<CacheHelper>(CacheHelper());
}