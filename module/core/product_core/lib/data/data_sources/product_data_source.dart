import 'dart:convert';

import 'package:product_core/data/models/product_model.dart';
import 'package:product_core/data/models/responses/product_response.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductList();
  Future<ProductModel> getProductDetail(int id);
}

class ProductDataSourceImpl extends ProductDataSource {
  ProductDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<ProductModel>> getProductList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/product',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).productList;
    } else if (response.statusCode == 417) {
      throw ServerException(INVALID_KEY);
    } else if (response.statusCode == 426) {
      throw ServerException(UPDATE_REQUIRED);
    } else if (response.statusCode == 500) {
      throw ServerException(INTERNAL_SERVER_ERROR);
    } else {
      throw ServerException('${response.statusCode}');
    }
  }

  @override
  Future<ProductModel> getProductDetail(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/product/$id',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      final result = ProductModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      return result;
    } else if (response.statusCode == 417) {
      throw ServerException(INVALID_KEY);
    } else if (response.statusCode == 426) {
      throw ServerException(UPDATE_REQUIRED);
    } else if (response.statusCode == 500) {
      throw ServerException(INTERNAL_SERVER_ERROR);
    } else {
      throw ServerException('${response.statusCode}');
    }
  }
}
