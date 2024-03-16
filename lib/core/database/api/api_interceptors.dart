import 'package:dio/dio.dart';
import 'package:pill_detection/core/database/api/end_point.dart';
import 'package:pill_detection/core/database/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[Apikeys.Authorization] =
        CacheHelper().getData(key: Apikeys.Authorization) != null
            ? 'Bearer ${CacheHelper().getData(key: Apikeys.Authorization)}'
            : null;
    super.onRequest(options, handler);
  }
}
