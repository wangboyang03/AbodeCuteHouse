import 'package:dio/dio.dart';
import '../constants/index.dart';
import 'TokenManager.dart';

class NetworkRequestUtil {
  final dio = Dio();
  get(String url, {Map<String, dynamic>? params}) {
    return handleResponse(dio.get(url, queryParameters: params));
  }
  post(String url, {Map<String, dynamic>? data}) {
    return handleResponse(dio.post(url, data: data));
  }
  put(String url, {Map<String, dynamic>? data}) {
    return handleResponse(dio.put(url, data: data));
  }
  delete(String url, {Map<String, dynamic>? data, Map<String, dynamic>? params}) {
    return handleResponse(dio.delete(url, data: data, queryParameters: params));
  }
  upload(String url) {}

  // 处理返回数据
  handleResponse(Future<Response<dynamic>> task) async {
    final result = await task;
    // 通过业务码判断
    if (result.data['code'] == Constants.SUCCESS_CODE) {
      return result.data['data']; // fullfiled
    }
    // 响应失败了
    throw DioException(requestOptions: result.requestOptions); // rejected
  }

  NetworkRequestUtil() {
    dio.options.baseUrl = Constants.BASE_URL;
    dio.options.connectTimeout = const Duration(seconds: Constants.NEW_WORK_TIME_OUT);
    dio.options.receiveTimeout = const Duration(seconds: Constants.NEW_WORK_TIME_OUT);
    dio.options.sendTimeout = const Duration(seconds: Constants.NEW_WORK_TIME_OUT);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (context, handler) {
        // 请求拦截器
        String token = tokenManager.getToken();
        if (!token.isEmpty) {
          context.headers["Authorization"] = 'Bearer ${token}';
        }
        handler.next(context);
      },onResponse: (context, handler) {
        // 需要判断Http状态码 只有2XX才认为是成功请求
        if (context.statusCode! >= 200 && context.statusCode! <300) {
          // 响应拦截器
          handler.next(context);
        } else {
          // 响应失败了
          handler.reject(DioException(requestOptions: context.requestOptions));
        }
      },onError: (context, handler) {
        // 错误拦截器
        handler.reject(context);
      }
    ));
  }
}

final networkRequestUtil = NetworkRequestUtil();