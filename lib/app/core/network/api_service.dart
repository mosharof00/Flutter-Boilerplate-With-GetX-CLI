import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/utils/logger.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';
import '../../data/models/auth_models/login_model.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';
import 'auth_interceptor.dart';

abstract class IApiService {
  ///  Login:
  Future<LoginModel> loginUser(String email, String password);

  ///  Get Product list
  Future<ProductsModel> getProducts();
}

class ApiServices implements IApiService {
  final Dio _dio;

  ApiServices()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoint.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      ) {
    _dio.interceptors.add(AuthInterceptor(_dio));
    // _dio.interceptors.add(
    //   LogInterceptor(
    //     request: true,
    //     requestBody: true,
    //     responseBody: true,
    //     error: true,
    //   ),
    // );
  }

  ///           Auth            ///

  ///  Login:
  @override
  Future<LoginModel> loginUser(String email, String password) async {
    final data = FormData.fromMap({'email': email, 'password': password});

    return _handleRequest<LoginModel>(
      () => _dio.post(ApiEndpoint.login, data: data),
      (dynamic data) => LoginModel.fromJson(data),
      'Login',
    );
  }

  ///  Get Product list
  @override
  Future<ProductsModel> getProducts() async {
    return _handleRequest<ProductsModel>(
      () => _dio.get(ApiEndpoint.productList),
      (dynamic data) => ProductsModel.fromJson(data),
      'Get Product List',
    );
  }
}

Future<T> _handleRequest<T>(
  Future<Response> Function() request,
  T Function(dynamic data) mapper,
  String apiName,
) async {
  try {
    debugPrint('Api Name: $apiName');
    final response = await request();
    // Log.w(response);
    return mapper(response.data);
  } on DioException catch (e) {
    debugPrint('DioException in $apiName: $e');
    throw ApiException.fromDio(e);
  } catch (e, stacktrace) {
    debugPrint('Unexpected error in $apiName: $e\n$stacktrace');
    Log.e('Error $apiName : ${e.toString()}');
    throw ApiException('Unexpected error: $e');
  }
}
