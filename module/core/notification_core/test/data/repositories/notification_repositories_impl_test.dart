import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notification_core/data/models/notification_detail_model.dart';
import 'package:notification_core/data/models/notification_model.dart';
import 'package:notification_core/data/repositories/notification_repository_impl.dart';
import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

import '../../tools/helper/test_helper.mocks.dart';

void main() {
  late NotificationRepositoryImpl repository;
  late MockNotificationDataSource dataSource;

  setUp(() {
    dataSource = MockNotificationDataSource();
    repository = NotificationRepositoryImpl(
      dataSource,
    );
  });

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

  final tNotificationDetailModel = NotificationDetailModel(
    id: 57,
    title: 'Percobaan Masuk',
    type: 'security',
    content: 'Percobaan masuk perangkat baru.',
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

  final tNotificationModelList = <NotificationModel>[tModel];
  final tNotificationList = <Notifications>[tEntity];

  group('Delete Notification', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(
        dataSource.deleteNotification(1),
      ).thenAnswer((_) async => true);

      // act
      final result = await repository.deleteNotification(1);

      // assert
      verify(dataSource.deleteNotification(1));
      expect(result, equals(const Right<bool, dynamic>(true)));
    });

    test('Call to remote data source is unsuccessful', () async {
      // arrange
      when(
        dataSource.deleteNotification(1),
      ).thenThrow(ServerException('Failed to delete notification'));

      // act
      final result = await repository.deleteNotification(1);

      // assert
      verify(dataSource.deleteNotification(1));
      expect(
        result,
        equals(
          const Left<ServerFailure, bool>(
            ServerFailure('Failed to delete notification'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(
        dataSource.deleteNotification(1),
      ).thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.deleteNotification(1);

      // assert
      verify(dataSource.deleteNotification(1));
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Notification Detail', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(
        dataSource.getNotificationDetail(1),
      ).thenAnswer((_) async => tNotificationDetailModel);

      // act
      final result = await repository.getNotificationDetail(1);

      // assert
      verify(
        dataSource.getNotificationDetail(1),
      );
      expect(
        result,
        equals(Right<Failure, NotificationDetail>(tNotificationDetailEntity)),
      );
    });

    test('Call to remote data source is unsuccessful', () async {
      // arrange
      when(
        dataSource.getNotificationDetail(1),
      ).thenThrow(ServerException('Failed to fetch detail'));

      // act
      final result = await repository.getNotificationDetail(1);

      // assert
      verify(
        dataSource.getNotificationDetail(1),
      );
      expect(
        result,
        equals(
          const Left<Failure, NotificationDetail>(
            ServerFailure('Failed to fetch detail'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(
        dataSource.getNotificationDetail(1),
      ).thenThrow(const SocketException(INTERNET_NOT_CONNECTED));

      // act
      final result = await repository.getNotificationDetail(1);

      // assert
      verify(
        dataSource.getNotificationDetail(1),
      );
      expect(
        result,
        equals(
          const Left<Failure, NotificationDetail>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Get Notification List', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      ).thenAnswer((_) async => tNotificationModelList);
      // act
      final result = await repository.getNotificationList(
        page: 1,
        type: '',
      );
      // assert
      verify(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      );
      final resultList = result.getOrElse(() => []);
      expect(
        resultList,
        tNotificationList,
      );
    });

    test('call to remote data source is unsuccessful', () async {
      // arrange
      when(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      ).thenThrow(ServerException(''));
      // act
      final result = await repository.getNotificationList(
        page: 1,
        type: '',
      );
      // assert
      verify(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      );
      expect(
        result,
        equals(
          const Left<ServerFailure, bool>(
            ServerFailure(''),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      ).thenThrow(const SocketException(INTERNET_NOT_CONNECTED));
      // act
      final result = await repository.getNotificationList(
        page: 1,
        type: '',
      );
      // assert
      verify(
        dataSource.getNotificationList(
          page: 1,
          type: '',
        ),
      );
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
  group('Read All Notifications', () {
    test('Call to remote data source is successful', () async {
      // arrange
      when(dataSource.readAllNotification()).thenAnswer((_) async => true);
      // act
      final result = await repository.readAllNotification();
      // assert
      verify(dataSource.readAllNotification());
      expect(result, equals(const Right<Failure, bool>(true)));
    });

    test('Call to remote data source fails with ServerException', () async {
      // arrange
      when(dataSource.readAllNotification())
          .thenThrow(ServerException('Server error'));
      // act
      final result = await repository.readAllNotification();
      // assert
      verify(dataSource.readAllNotification());
      expect(
        result,
        equals(
          const Left<ServerFailure, bool>(
            ServerFailure('Server error'),
          ),
        ),
      );
    });

    test('When the device is not connected to internet', () async {
      // arrange
      when(dataSource.readAllNotification())
          .thenThrow(const SocketException(INTERNET_NOT_CONNECTED));
      // act
      final result = await repository.readAllNotification();
      // assert
      verify(dataSource.readAllNotification());
      expect(
        result,
        equals(
          const Left<Failure, bool>(
            ConnectionFailure(INTERNET_NOT_CONNECTED),
          ),
        ),
      );
    });
  });
}
