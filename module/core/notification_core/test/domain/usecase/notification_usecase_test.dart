import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

import '../../tools/helper/test_helper.mocks.dart';

void main() {
  late NotificationUsecaseImpl usecase;
  late MockNotificationRepository repository;

  setUp(() {
    repository = MockNotificationRepository();
    usecase = NotificationUsecaseImpl(repository);
  });

  final tEntity = Notifications(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );

  final tNotificationDetailEntity = NotificationDetail(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    content: 'Percobaan masuk perangkat baru.',
    isReaded: false,
    createdAt: DateTime.parse('2025-02-10 15:01:06'),
    updatedAt: DateTime.parse('2025-02-10 15:01:06'),
  );
  final tNotificationList = <Notifications>[tEntity];

  group('Notification Usecase', () {
    test('Delete Notification', () async {
      // arrange
      when(repository.deleteNotification(1))
          .thenAnswer((_) async => const Right(true));
      // act
      final result = await usecase.deleteNotification(1);
      // assert
      expect(result, const Right<Failure, bool>(true));
    });

    test('Get Notification Detail', () async {
      // arrange
      when(repository.getNotificationDetail(1))
          .thenAnswer((_) async => Right(tNotificationDetailEntity));
      // act
      final result = await usecase.getNotificationDetail(1);
      // assert
      expect(
        result,
        Right<Failure, NotificationDetail>(tNotificationDetailEntity),
      );
    });
    test('Get Notification List', () async {
      // arrange
      when(repository.getNotificationList(page: 1, type: ''))
          .thenAnswer((_) async => Right(tNotificationList));
      // act
      final result = await usecase.getNotificationList(page: 1, type: '');
      // assert
      expect(result, Right<Failure, List<Notifications>>(tNotificationList));
    });
    test('Read All Notification', () async {
      // arrange
      when(repository.readAllNotification())
          .thenAnswer((_) async => const Right(true));
      // act
      final result = await usecase.readAllNotification();
      // assert
      expect(result, const Right<Failure, bool>(true));
    });
  });
}
