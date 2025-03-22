import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:shared_common/failure.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, bool>> deleteNotification(int id);
  Future<Either<Failure, List<Notifications>>> getNotificationList({
    required int page,
    required String type,
  });
  Future<Either<Failure, NotificationDetail>> getNotificationDetail(int id);
  Future<Either<Failure, bool>> readAllNotification();
}
