import 'dart:convert';

import 'package:banner_core/data/models/banner_detail_model.dart';
import 'package:banner_core/data/models/banner_model.dart';
import 'package:banner_core/data/models/responses/banner_detail_response.dart';
import 'package:banner_core/data/models/responses/banner_response.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

// ignore: one_member_abstracts
abstract class BannerDataSource {
  Future<List<BannerModel>> getBannerList();
  Future<BannerDetailModel> getBannerDetail(int id);
}

class BannerDataSourceImpl extends BannerDataSource {
  BannerDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<BannerModel>> getBannerList() async {
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
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/banner',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      return BannerResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).bannerList;
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
  Future<BannerDetailModel> getBannerDetail(int id) async {
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
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/banner/$id',
    );

    final response = await http.get(url, headers: headers);
    // print('RESULT: $url');
    // print('RESULT: ${response.statusCode}');
    // print('RESULT: ${response.body}');
    if (response.statusCode == 200) {
      final result = BannerDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
      return result.banner;
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
