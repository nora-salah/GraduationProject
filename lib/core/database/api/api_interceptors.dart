import 'package:dio/dio.dart';
import 'package:pill_detection/core/database/api/end_point.dart';
import 'package:pill_detection/core/database/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[Apikeys.token] =
    CacheHelper().getData(key: Apikeys.token) != null
        ? ' ${CacheHelper().getData(key: Apikeys.token)}'
        : null;    super.onRequest(options, handler);
  }
}