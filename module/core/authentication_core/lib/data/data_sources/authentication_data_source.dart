import 'dart:convert';

import 'package:authentication_core/data/models/otp_model.dart';
import 'package:authentication_core/data/models/otp_response.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

abstract class AuthenticationDataSource {
  Future<bool> signIn(String phoneNumber);
  Future<bool> signOut();
  Future<OTPModel> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  });
}

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  AuthenticationDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<bool> signIn(String phoneNumber) async {
    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
    };
    final body = {
      'phone': phoneNumber,
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/signin',
    );

    final response = await http.post(url, headers: headers, body: body);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      throw ServerException(AuthenticationException.otpCooldown);
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
  Future<bool> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/signout',
    );
    final response = await client.post(url, headers: headers);
    if (response.statusCode == 200) {
      await prefs.remove(ACCESS_TOKEN);
      return true;
    } else if (response.statusCode == 401) {
      await prefs.remove(ACCESS_TOKEN);
      throw ServerException(UNAUTHENTICTED);
    } else if (response.statusCode == 417) {
      throw ServerException(INVALID_KEY);
    } else if (response.statusCode == 426) {
      throw ServerException(UPDATE_REQUIRED);
    } else if (response.statusCode == 500) {
      throw ServerException(INTERNAL_SERVER_ERROR);
    } else {
      await prefs.remove(ACCESS_TOKEN);
      throw ServerException('${response.statusCode}');
    }
  }

  @override
  Future<OTPModel> verificationOTP({
    required String phoneNumber,
    required String otpCode,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
    };
    final body = {
      'phone': phoneNumber,
      'otp': otpCode,
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/verification',
    );

    final response = await http.post(url, headers: headers, body: body);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      final result = OTPResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).otp;
      await prefs.setString(ACCESS_TOKEN, result.token);
      return result;
    } else if (response.statusCode == 400) {
      throw ServerException(AuthenticationException.otpInvalid);
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
