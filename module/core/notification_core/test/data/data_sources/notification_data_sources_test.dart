import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notification_core/data/data_sources/notification_data_source.dart';
import 'package:notification_core/data/models/responses/notification_detail_response.dart';
import 'package:notification_core/data/models/responses/notification_response.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

import '../../tools/helper/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NotificationDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late Map<String, String> headers;

  setUpAll(() {
    SharedPreferences.setMockInitialValues({
      'ACCESS_TOKEN':
          // ignore: lines_longer_than_80_chars
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDA0MTRmMzRiYmNiMjBkZTk4ZTEwZTMwNTFhYjhkMDk5M2RjMGM2MGEwMjhjODQ5YjlkNGFiNzQ1OGQ1YjQ0MzY3ZDYwMTczMDJlMWRmNDAiLCJpYXQiOjE3MzkxNzQ0ODguOTkzMTExLCJuYmYiOjE3MzkxNzQ0ODguOTkzMTEzLCJleHAiOjE3NzA3MTA0ODguOTkyMjMxLCJzdWIiOiIxMSIsInNjb3BlcyI6W119.kh3uo-pYL0e5c-ZS7xVrf-2OxAUOz5UDuomEv4hZaeRfbx-n9kVcBr1_QQ4811vQExOgS4DD81MPqg5edzNEGtwzSDk_MYPg6pqbOPIxgCr4bivF_ue_TXHcbPakFMBt4v1R2pHQyNKkJUEFqPLvuUQ3WS_ZNZg8d9kW1JA4qUU8D8IX7nqiKG0ci2Ag-TrIqdlF68Qyje43XyOh_T-YNHFlezciDuY-mKtKW2Bxr5l9oeBJrqE1oNy3K0PiZl_FN15dzRizT-jEDdaaiNmMTeclp1phqBaURaZfJl7vHmkg3OIwuNS5t5dprTc2h7sYNLg5swstTcWEWjh_3hTUcTUK3NGL1fd5gNrd-z1cqPNWeaXVVFtJwSZA6Rb_RTKGAGjcoCWRxiF-lVBSfFq582jZXH_OdxrVVYC97sHS8YUBV1yf0iUz7UmFYt7EqHSACcqtsXaSAX6yXOrkmB49jhfDjZuCYaeC8xUhIfnHA60XALwW1_9cJtQBk5ij3YXouD7M3lFSR8R8N_EBCchYZfSH74QZ6H1gpo7t1Ud85tkKjGd3VvvwbfO9_bAeCwNsbqcI_F0IFVuEstKCpcDK4KZ-VGbNkY0ErBpyHr3Kyqo83SX4CGy7-y8JM0FCEiMgDvP9A3szgD-C5KqViVW2PwefYcmyOcW4rUToSQou-cs', // Nilai contoh
    });
  });

  setUp(() async {
    mockHttpClient = MockHttpClient();
    dataSource = NotificationDataSourceImpl(mockHttpClient);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(ACCESS_TOKEN);

    // Headers
    headers = {
      // 'app_key': AppConfig().isDev ? DEV_APP_KEY : APP_KEY,
      // 'app_version': SERVER_VERSION,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  });
  group('Delete Notification', () {
    // URL API
    Uri getDeleteUrl(int id) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path: id == 0
              ? '/api/customer/notification/[]'
              : '/api/customer/notification/["$id"]',
        );

    test('Return true when the response code is 200', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.deleteNotification(1);
      // assert
      expect(result, equals(true));
    });

    test('Throw a ServerException when the response code is 400', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Type Data', 400),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('When the response code is 401', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Unauthorized', 401),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      final url = getDeleteUrl(1);
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.deleteNotification(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Notification List', () {
    // Mock Data Initiation
    final jsonString = readJson('tools/dummy_data/notification_list.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final tList = NotificationResponse.fromJson(jsonMap).notificationList;

    // URL API
    Uri getNotificationUrl({required int page, required String type}) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/notification',
          queryParameters: {
            'page': '$page',
            'type': type,
          },
        );

    test('Return Notification Model when the response code is 200', () async {
      // arrange
      final url = getNotificationUrl(page: 1, type: '');
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response(jsonString, 200),
      );
      // act
      final result = await dataSource.getNotificationList(page: 1, type: '');
      // assert
      expect(result, equals(tList));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      final url = getNotificationUrl(page: 1, type: '');
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.getNotificationList(page: 1, type: '');
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      final url = getNotificationUrl(page: 1, type: '');
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.getNotificationList(page: 1, type: '');
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      final url = getNotificationUrl(page: 1, type: '');
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.getNotificationList(page: 1, type: '');
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      final url = getNotificationUrl(page: 1, type: '');
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getNotificationList(page: 1, type: '');
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Notification Detail', () {
    // Mock Data Initiation
    final jsonString = readJson('tools/dummy_data/notification_show.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final tDetail = NotificationDetailResponse.fromJson(jsonMap).notification;

    // URL API
    Uri getNotificationDetailUrl(int id) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/notification/$id',
        );

    test('Return Notification Detail Model when the response code is 200',
        () async {
      // arrange
      final url = getNotificationDetailUrl(1);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response(jsonString, 200),
      );
      // act
      final result = await dataSource.getNotificationDetail(1);
      // assert
      expect(result, equals(tDetail));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      final url = getNotificationDetailUrl(1);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.getNotificationDetail(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      final url = getNotificationDetailUrl(1);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.getNotificationDetail(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      final url = getNotificationDetailUrl(1);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.getNotificationDetail(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      final url = getNotificationDetailUrl(1);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getNotificationDetail(1);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Read All Notifications', () {
    // URL API
    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/notification',
    );

    test('Return true when the response code is 200', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.readAllNotification();
      // assert
      expect(result, isTrue);
    });

    test('Throw a ServerException when the response code is 417 (INVALID_KEY)',
        () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.readAllNotification();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.readAllNotification();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.readAllNotification();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404 (Not Found)',
        () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.readAllNotification();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
