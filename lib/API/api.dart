import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scube_project_tracker/Util/Util.dart';
import '../Helper/api_url.dart';

class Api {
  Dio dio = Dio();
  final getStorage = GetStorage();

  Api() {
    dio = Dio(
      BaseOptions(
        baseUrl: ROOT_API_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        followRedirects: true,
        receiveTimeout: const Duration(seconds: 10000),
        connectTimeout: const Duration(seconds: 10000),
        sendTimeout: const Duration(seconds: 10000),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = getAuthToken();

          print("${options.method} : ${options.uri}");
          if (options.data != null) print("Data: ${options.data}");

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
