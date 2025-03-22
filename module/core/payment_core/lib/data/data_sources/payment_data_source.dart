import 'dart:convert';

import 'package:payment_core/data/models/payment_model.dart';
import 'package:payment_core/data/models/responses/payment_response.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

// ignore: one_member_abstracts
abstract class PaymentDataSource {
  Future<List<PaymentModel>> getPaymentList();
}

class PaymentDataSourceImpl extends PaymentDataSource {
  PaymentDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<PaymentModel>> getPaymentList() async {
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
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/payment',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return PaymentResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).paymentList;
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
