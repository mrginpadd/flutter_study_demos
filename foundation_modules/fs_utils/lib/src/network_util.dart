import 'package:dio/dio.dart';
class NetworkUtil {
  NetworkUtil._internal();
  factory NetworkUtil.shared() => _instance;
  static late final NetworkUtil _instance = NetworkUtil._internal();

  //通用性、健壮性、可维护性
  //网络工具类需要考虑的点
  //1.统一的请求方法封装 (Get\Post\Put\Delete等)
  //2.错误处理与异常捕获
  //3.超时控制
  //4.请求头和请求体的处理
  //5.响应数据解析
  //6.异步操作与返回值
  //7.网络状态检测
  //8.缓存策略
  //9.拦截器支持（请求拦截、响应拦截、错误拦截、请求hooks）
  //10.重试机制
  //11.日志记录
  //取消请求、取消重复请求、设置白名单、权限管控

  Future<Response> get(String url, {Map<String, String>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  Future<Response> post(String url, {Map<String, String>? headers, dynamic body}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  Future<Response> put(String url, {Map<String, String>? headers, dynamic body}) {
    // TODO: implement get
    throw UnimplementedError();
  }
  Future<Response> delete(String url, {Map<String, String>? headers, dynamic body}) {
    // TODO: implement get
    throw UnimplementedError();
  }

}
