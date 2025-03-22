import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notification_core/data/models/notification_model.dart';
import 'package:notification_core/data/models/responses/notification_response.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

void main() {
  final tModel = NotificationModel(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  final tResponseModel = NotificationResponse(
    notificationList: <NotificationModel>[tModel],
  );
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonString = readJson('tools/dummy_data/notification_list.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = NotificationResponse.fromJson(jsonMap);
      // assert
      expect(
        result.notificationList.first,
        tResponseModel.notificationList.first,
      );
      expect(
        result.notificationList.first,
        tResponseModel.notificationList.first,
      );
      expect(
        result.notificationList.first,
        tResponseModel.notificationList.first,
      );
    });
  });
}
