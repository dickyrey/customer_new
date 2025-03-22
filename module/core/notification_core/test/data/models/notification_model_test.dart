import 'package:flutter_test/flutter_test.dart';
import 'package:notification_core/data/models/notification_model.dart';
import 'package:notification_core/domain/entities/notification.dart';

void main() {
  final tModel = NotificationModel(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  final tEntity = Notifications(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  test('should be a subclass of entity', () async {
    final result = tModel.toEntity();
    expect(result, tEntity);
  });
}
