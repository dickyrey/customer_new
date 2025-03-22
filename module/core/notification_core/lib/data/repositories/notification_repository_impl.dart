import 'dart:io';

import 'package:notification_core/data/data_sources/notification_data_source.dart';
import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:notification_core/domain/repositories/notification_repository.dart';
import 'package:shared_common/exception.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl(this.dataSource);

  final NotificationDataSource dataSource;

  @override
  Future<Either<Failure, bool>> deleteNotification(int id) async {
    try {
      final result = await dataSource.deleteNotification(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, NotificationDetail>> getNotificationDetail(
    int id,
  ) async {
    try {
      final result = await dataSource.getNotificationDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, List<Notifications>>> getNotificationList({
    required int page,
    required String type,
  }) async {
    try {
      final result = await dataSource.getNotificationList(
        page: page,
        type: type,
      );
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> readAllNotification() async {
    try {
      final result = await dataSource.readAllNotification();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(INTERNET_NOT_CONNECTED),
      );
    }
  }
}
