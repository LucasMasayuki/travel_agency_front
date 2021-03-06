import 'package:dio/dio.dart';
import 'package:travel_agency_front/app/config/env.dart';
import 'package:travel_agency_front/app/services/dio/interceptors.dart';

class ApiService {
  final Dio _client;

  ApiService(this._client);

  Future<Dio> getClient() async {
    Interceptor interceptor = LoggingInterceptors();

    _client..interceptors.add(interceptor);
    _client.options.headers.addAll({
      'accept': 'application/json',
    });

    // Base Url
    _client.options.baseUrl = Env.baseUrl;
    return _client;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    final client = await getClient();

    final response = await client.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);

    return response;
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    final client = await getClient();
    final response = await client.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }
}
