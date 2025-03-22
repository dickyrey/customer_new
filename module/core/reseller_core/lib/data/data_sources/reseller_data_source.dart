import 'dart:convert';

import 'package:reseller_core/data/models/responses/submission_detail_response.dart';
import 'package:reseller_core/data/models/responses/submission_response.dart';
import 'package:reseller_core/data/models/submission_detail_model.dart';
import 'package:reseller_core/data/models/submission_model.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

abstract class ResellerDataSource {
  Future<bool> cancelSubmission(int id);
  Future<List<SubmissionModel>> getSubmissionList(
    int page,
  );
  Future<SubmissionDetailModel> getSubmissionDetail(
    int id,
  );
  Future<bool> submission({
    required int addressId,
    required String name,
  });
}

class ResellerDataSourceImpl extends ResellerDataSource {
  ResellerDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<bool> cancelSubmission(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/reseller_submission/$id',
    );

    final response = await http.delete(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
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
  Future<List<SubmissionModel>> getSubmissionList(
    int page,
  ) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/reseller_submission',
      queryParameters: {
        'page': '$page',
      },
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return SubmissionResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).submissionList;
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
  Future<SubmissionDetailModel> getSubmissionDetail(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/reseller_submission/$id',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return SubmissionDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).submission;
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
  Future<bool> submission({
    required int addressId,
    required String name,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    final headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = {'address_id': '$addressId', 'store': name};

    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/reseller_submission',
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
      throw ServerException(ResellerException.underReview);
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
