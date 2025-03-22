import 'dart:convert';

import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';
import 'package:user_core/data/models/responses/user_response.dart';
import 'package:user_core/data/models/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> getCurrentUser();
  Future<bool> profile({
    required String fullName,
    required int salesId,
  });
  Future<bool> requestOTP(String phoneNumber);
  Future<bool> register({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
  });
  Future<bool> security({
    required String phoneNumber,
    required String otpCode,
  });
}

class UserDataSourceImpl extends UserDataSource {
  UserDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<UserModel> getCurrentUser() async {
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
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/user',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return UserResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).user;
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
  Future<bool> profile({
    required String fullName,
    required int salesId,
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
      'name': fullName,
      'sales_id': salesId == 0 ? '' : '$salesId',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/user',
      queryParameters: {
        'request': 'profile',
      },
    );

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
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
  Future<bool> requestOTP(String phoneNumber) async {
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

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );
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
  Future<bool> register({
    required int streetId,
    required String name,
    required String phone,
    required String address,
    required String type,
    required double latitude,
    required double longitude,
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
      'street_id': '$streetId',
      'name': name,
      'phone': phone,
      'address': address,
      'type': type,
      'latitude': '$latitude',
      'longitude': '$longitude',
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/user',
      queryParameters: {
        'request': 'register',
      },
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
      return true;
    } else if (response.statusCode == 400) {
      throw ServerException(UserException.numberAlreadyRegister);
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
  Future<bool> security({
    required String phoneNumber,
    required String otpCode,
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
      'phone': phoneNumber,
      'otp': otpCode,
    };

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/user',
      queryParameters: {
        'request': 'security',
      },
    );

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      throw ServerException(UserException.numberAlreadyRegister);
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
