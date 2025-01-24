

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../config/environment.dart';

class DioClient extends DioForNative {
  final Environment _environment;
  String? _authToken;

  DioClient({
    required Environment environment,
  }) : _environment = environment {
    options = BaseOptions(
      baseUrl: _environment.baseUrl,
      responseType: ResponseType.json,
    );

    interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_authToken != null) {
            options.headers['Authorization'] = 'Bearer $_authToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {

          }

          return handler.next(error);
        },
      ),
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ]);
  }
}

