import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:notification_core/domain/repositories/notification_repository.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class NotificationUsecase {
  Future<Either<Failure, bool>> deleteNotification(int id);
  Future<Either<Failure, List<Notifications>>> getNotificationList({
    required int page,
    required String type,
  });
  Future<Either<Failure, NotificationDetail>> getNotificationDetail(int id);
  Future<Either<Failure, bool>> readAllNotification();
}

class NotificationUsecaseImpl extends NotificationUsecase {
  NotificationUsecaseImpl(this.repository);

  final NotificationRepository repository;

  @override
  Future<Either<Failure, bool>> deleteNotification(int id) {
    return repository.deleteNotification(id);
  }

  @override
  Future<Either<Failure, NotificationDetail>> getNotificationDetail(int id) {
    return repository.getNotificationDetail(id);
  }

  @override
  Future<Either<Failure, List<Notifications>>> getNotificationList({
    required int page,
    required String type,
  }) {
    return repository.getNotificationList(
      page: page,
      type: type,
    );
  }

  @override
  Future<Either<Failure, bool>> readAllNotification() {
    return repository.readAllNotification();
  }
}
