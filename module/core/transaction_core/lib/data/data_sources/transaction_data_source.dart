import 'dart:convert';

import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';
import 'package:transaction_core/data/models/responses/transaction_detail_response.dart';
import 'package:transaction_core/data/models/responses/transaction_response.dart';
import 'package:transaction_core/data/models/transaction_detail_model.dart';
import 'package:transaction_core/data/models/transaction_model.dart';

abstract class TransactionDataSource {
  Future<bool> cancelTransaction(int id);
  Future<TransactionDetailModel> completeTransaction(int id);
  Future<TransactionDetailModel> createTransaction({
    required int addressId,
    required int paymentId,
    required String jsonString,
    required bool isUsePoint,
  });
  Future<List<TransactionModel>> getTransactionList({
    required int page,
    required String status,
  });
  Future<TransactionDetailModel> getTransactionDetail(int id);
  Future<bool> reviewTransaction({
    required int id,
    required int rating,
    required String review,
  });
}

class TransactionDataSourceImpl extends TransactionDataSource {
  TransactionDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<bool> cancelTransaction(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction/$id',
    );

    final response = await http.delete(
      url,
      headers: headers,
    );
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      throw ServerException(TransactionException.notFound);
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
  Future<TransactionDetailModel> completeTransaction(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction/$id',
      queryParameters: {
        'type': 'finish',
      },
    );

    final response = await http.put(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.body);
      final result = TransactionDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      return result.transactionDetail;
    } else if (response.statusCode == 404) {
      throw ServerException(TransactionException.notFound);
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
  Future<TransactionDetailModel> createTransaction({
    required int addressId,
    required int paymentId,
    required String jsonString,
    required bool isUsePoint,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = {
      'address_id': '$addressId',
      'payment_id': '$paymentId',
      'products': jsonString,
      'use_point': isUsePoint ? '1' : '0',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction',
    );

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      final result = TransactionDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).transactionDetail;
      return result;
    } else if (response.statusCode == 400) {
      throw ServerException(TransactionException.outOfStock);
    } else if (response.statusCode == 404) {
      throw ServerException(TransactionException.notFound);
    } else if (response.statusCode == 417) {
      throw ServerException(TransactionException.outsideOperationHour);
    } else if (response.statusCode == 426) {
      throw ServerException(UPDATE_REQUIRED);
    } else if (response.statusCode == 500) {
      throw ServerException(INTERNAL_SERVER_ERROR);
    } else {
      throw ServerException('${response.statusCode}');
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionList({
    required int page,
    required String status,
  }) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction',
      queryParameters: {
        'page': '$page',
        'order': 'latest',
        'status': status,
      },
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return TransactionResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).transactionList;
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
  Future<TransactionDetailModel> getTransactionDetail(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction/$id',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      final result = TransactionDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      return result.transactionDetail;
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
  Future<bool> reviewTransaction({
    required int id,
    required int rating,
    required String review,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = {
      'rating': '$rating',
      'review': 'Pesanan berhasil',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/transaction/$id',
      queryParameters: {
        'type': 'review',
      },
    );

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      throw ServerException(TransactionException.notFound);
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
