import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:notification_core/data/models/notification_detail_model.dart';
import 'package:notification_core/data/models/responses/notification_detail_response.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

void main() {
  final tModel = NotificationDetailModel(
    id: 57,
    title: 'Percobaan Masuk',
    content: 'Percobaan masuk perangkat baru.',
    type: 'security',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  final tResponseModel = NotificationDetailResponse(
    notification: tModel,
  );
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonString = readJson('tools/dummy_data/notification_show.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = NotificationDetailResponse.fromJson(jsonMap);
      // assert
      expect(
        result.notification,
        tResponseModel.notification,
      );
    });
  });
}
