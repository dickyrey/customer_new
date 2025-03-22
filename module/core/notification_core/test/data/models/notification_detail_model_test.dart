import 'package:flutter_test/flutter_test.dart';
import 'package:notification_core/data/models/notification_detail_model.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';

void main() {
  final tModel = NotificationDetailModel(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    content: 'Percobaan masuk perangkat baru.',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  final tEntity = NotificationDetail(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    content: 'Percobaan masuk perangkat baru.',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  test('should be a subclass of entity', () async {
    final result = tModel.toEntity();
    expect(result, tEntity);
  });
}
