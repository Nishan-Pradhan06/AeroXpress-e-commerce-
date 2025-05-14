import 'package:deal_sell/core/constant/api.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
    headers: {'Content': 'application/json', 'Accept': 'application/json'},
  );

  DioClient() {
    _dio = Dio(_baseOptions);
  }

  Dio get dio => _dio;

  void _addIntercetos() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            if (await _refreshToken()) {
              return handler.resolve(await _retry(error.requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<String?> _getToken() async {
    return null;
  }

  Future<bool> _refreshToken() async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _saveToken(String token) async {}
}
