import 'dart:convert';

import 'package:address_core/data/data_sources/address_data_source.dart';
import 'package:address_core/data/models/responses/address_detail_response.dart';
import 'package:address_core/data/models/responses/address_response.dart';
import 'package:address_core/data/models/responses/street_response.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_common/config.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

import '../../tools/helper/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AddressDataSourceImpl dataSource;
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
    dataSource = AddressDataSourceImpl(mockHttpClient);

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

  group('Create Address', () {
    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path: '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address',
    );

    final body = {
      'street_id': '123',
      'name': 'John Doe',
      'phone': '08123456789',
      'address': '123 Main St',
      'type': 'Home',
      'latitude': '37.7749',
      'longitude': '-122.4194',
    };

    test('Return true when the response code is 200', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers, body: body)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.createAddress(
        streetId: 123,
        name: 'John Doe',
        phone: '08123456789',
        address: '123 Main St',
        type: 'Home',
        latitude: 37.7749,
        longitude: -122.4194,
      );
      // assert
      expect(result, isTrue);
    });

    test('Throw a ServerException when the response code is 417 (INVALID_KEY)',
        () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers, body: body)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.createAddress(
        streetId: 123,
        name: 'John Doe',
        phone: '08123456789',
        address: '123 Main St',
        type: 'Home',
        latitude: 37.7749,
        longitude: -122.4194,
      );
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426 ', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers, body: body)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.createAddress(
        streetId: 123,
        name: 'John Doe',
        phone: '08123456789',
        address: '123 Main St',
        type: 'Home',
        latitude: 37.7749,
        longitude: -122.4194,
      );
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers, body: body)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.createAddress(
        streetId: 123,
        name: 'John Doe',
        phone: '08123456789',
        address: '123 Main St',
        type: 'Home',
        latitude: 37.7749,
        longitude: -122.4194,
      );
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 400 (Bad Request)',
        () async {
      // arrange
      when(mockHttpClient.post(url, headers: headers, body: body)).thenAnswer(
        (_) async => http.Response('Bad Request', 400),
      );
      // act
      final call = dataSource.createAddress(
        streetId: 123,
        name: 'John Doe',
        phone: '08123456789',
        address: '123 Main St',
        type: 'Home',
        latitude: 37.7749,
        longitude: -122.4194,
      );
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Delete Address', () {
    const id = 123;
    final url = Uri(
      scheme: SCHEME,
      host: AppConfig().isDev ? DEV_HOST : HOST,
      path:
          '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address/$id',
    );

    test('Return true when the response code is 200', () async {
      // arrange
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.deleteAddress(id);
      // assert
      expect(result, isTrue);
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.deleteAddress(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.deleteAddress(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.deleteAddress(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 400 ', () async {
      // arrange
      when(mockHttpClient.delete(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Bad Request', 400),
      );
      // act
      final call = dataSource.deleteAddress(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Get Address List', () {
    // Mock Data Initiation
    final jsonString = readJson('tools/dummy_data/address_list.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final tList = AddressResponse.fromJson(jsonMap).addressList;

    // URL API
    Uri getAddressUrl() => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address',
        );

    test('Return Address Model when the response code is 200', () async {
      // arrange
      final url = getAddressUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response(jsonString, 200),
      );
      // act
      final result = await dataSource.getAddressList();
      // assert
      expect(result, equals(tList));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      final url = getAddressUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.getAddressList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      final url = getAddressUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.getAddressList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      final url = getAddressUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.getAddressList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      final url = getAddressUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getAddressList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Get Current Position', () {
    late MockGeolocatorPlatform mockGeolocator;

    const geolocatorChannel = MethodChannel('flutter.baseflow.com/geolocator');
    setUp(() {
      mockGeolocator = MockGeolocatorPlatform();

      // Mock the platform channel methods
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(geolocatorChannel,
              (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'isLocationServiceEnabled':
            return true; // Mock location service enabled
          case 'checkPermission':
            return 1; // LocationPermission.whileInUse (equivalent value)
          case 'getCurrentPosition':
            return {
              'latitude': 1.23456,
              'longitude': 2.34567,
              'accuracy': 10.0,
              'altitude': 100.0,
              'heading': 0.0,
              'speed': 0.0,
              'speed_accuracy': 0.0,
              'timestamp': DateTime.now().millisecondsSinceEpoch,
            };
          default:
            return null;
        }
      });
    });

    test('Return true when location services are enabled', () async {
      // Arrange
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);

      // Act
      final result =
          await GeolocatorPlatform.instance.isLocationServiceEnabled();

      // Assert
      expect(result, equals(true));
    });
  });
  group('Get Street List', () {
    // Mock Data Initiation
    final jsonString = readJson('tools/dummy_data/street_list.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final tList = StreetResponse.fromJson(jsonMap).streetList;

    // URL API
    Uri getStreetUrl() => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/street',
        );

    test('Return Street Model when the response code is 200', () async {
      // arrange
      final url = getStreetUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response(jsonString, 200),
      );
      // act
      final result = await dataSource.getStreetList();
      // assert
      expect(result, equals(tList));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      final url = getStreetUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.getStreetList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      final url = getStreetUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.getStreetList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      final url = getStreetUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.getStreetList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      final url = getStreetUrl();
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getStreetList();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Get Address Detail', () {
    // Mock Data Initiation
    final jsonString = readJson('tools/dummy_data/address_show.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final tAddressDetail = AddressDetailResponse.fromJson(jsonMap).address;

    // URL API
    Uri getAddressDetailUrl(int id) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address/$id',
        );

    test('Return Address Detail Model when the response code is 200', () async {
      // arrange
      const id = 1;
      final url = getAddressDetailUrl(id);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response(jsonString, 200),
      );
      // act
      final result = await dataSource.getAddressDetail(id);
      // assert
      expect(result, equals(tAddressDetail));
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      const id = 1;
      final url = getAddressDetailUrl(id);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.getAddressDetail(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      const id = 1;
      final url = getAddressDetailUrl(id);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.getAddressDetail(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      const id = 1;
      final url = getAddressDetailUrl(id);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.getAddressDetail(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      const id = 1;
      final url = getAddressDetailUrl(id);
      when(mockHttpClient.get(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.getAddressDetail(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Set Default Address', () {
    // URL API
    Uri setDefaultAddressUrl(int id) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address/$id',
          queryParameters: {
            'request': 'change_default',
          },
        );

    test('Return true when the response code is 200', () async {
      // arrange
      const id = 1;
      final url = setDefaultAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers)).thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.setDefault(id);
      // assert
      expect(result, isTrue);
    });

    test('Throw a ServerException when the response code is 417', () async {
      // arrange
      const id = 1;
      final url = setDefaultAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Invalid Key', 417),
      );
      // act
      final call = dataSource.setDefault(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 426', () async {
      // arrange
      const id = 1;
      final url = setDefaultAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Update Required', 426),
      );
      // act
      final call = dataSource.setDefault(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      const id = 1;
      final url = setDefaultAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.setDefault(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });

    test('Throw a ServerException when the response code is 404', () async {
      // arrange
      const id = 1;
      final url = setDefaultAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers)).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      // act
      final call = dataSource.setDefault(id);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
  group('Update Address', () {
    Uri updateAddressUrl(int id) => Uri(
          scheme: SCHEME,
          host: AppConfig().isDev ? DEV_HOST : HOST,
          path:
              '${AppConfig().isDev ? DEV_PATH : PROD_PATH}/api/customer/address/$id',
        );

    test('Return true when the response code is 200', () async {
      // arrange
      const id = 1;
      final url = updateAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers, body: anyNamed('body')))
          .thenAnswer(
        (_) async => http.Response('', 200),
      );
      // act
      final result = await dataSource.updateAddress(
        id: id,
        streetId: 123,
        name: 'Test Name',
        phone: '1234567890',
        address: 'Test Address',
        type: 'home',
        latitude: 1.2345,
        longitude: 2.3456,
      );
      // assert
      expect(result, isTrue);
    });

    test('Throw a ServerException when the response code is 500', () async {
      // arrange
      const id = 1;
      final url = updateAddressUrl(id);
      when(mockHttpClient.put(url, headers: headers, body: anyNamed('body')))
          .thenAnswer(
        (_) async => http.Response('Internal Server Error', 500),
      );
      // act
      final call = dataSource.updateAddress(
        id: id,
        streetId: 123,
        name: 'Test Name',
        phone: '1234567890',
        address: 'Test Address',
        type: 'home',
        latitude: 1.2345,
        longitude: 2.3456,
      );
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
