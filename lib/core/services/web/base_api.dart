import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../../../constants/network-config/network_config.dart';
import '../../../locator.dart';
import '../local/storage_services.dart';

StorageService storageService = locator<StorageService>();

connect() {
  BaseOptions options = BaseOptions(
      baseUrl: NetworkConfig.BASE_URL,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
      responseType: ResponseType.plain);
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? value = await storageService.readItem(key: token);
        print("Thi is my value: $value");
        if (value != null && value.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $value";
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        // print(response.data);

        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        // if (e.response?.data.contains('expired')) {
        //   navigationService.navigateTo(mainAuthRoute);
        // }

        return handler.next(e);
      },
    ),
  );
  return dio;
}
