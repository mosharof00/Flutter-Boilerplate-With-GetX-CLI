import 'package:flutter_boilerplate_with_getx_cli/app/core/network/api_client.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/network/api_endpoints.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';

abstract class IProductRepository {
  Future<ProductsModel> getProducts();
}

class ProductRepository implements IProductRepository {
  final ApiClient _client;

  ProductRepository(this._client);

  @override
  Future<ProductsModel> getProducts() {
    return _client.handleRequest(
          () => _client.dio.get(ApiEndpoint.productList),
          (dynamic data) => ProductsModel.fromJson(data),
      'Get Products',
    );
  }
}