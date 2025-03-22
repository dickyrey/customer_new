import 'package:notification_core/data/data_sources/notification_data_source.dart';
import 'package:notification_core/data/repositories/notification_repository_impl.dart';
import 'package:notification_core/domain/repositories/notification_repository.dart';
import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class NotificationCoreInjection {
  NotificationCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<NotificationDataSource>(
      () => NotificationDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<NotificationUsecase>(
      () => NotificationUsecaseImpl(locator()),
    );
  }
}
