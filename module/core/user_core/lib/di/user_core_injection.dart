import 'package:shared_libraries/get_it/get_it.dart';
import 'package:user_core/data/data_sources/user_data_source.dart';
import 'package:user_core/data/repositories/user_repository_impl.dart';
import 'package:user_core/domain/repositories/user_repository.dart';
import 'package:user_core/domain/usecases/user_usecase.dart';

class UserCoreInjection {
  UserCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<UserUsecase>(
      () => UserUsecaseImpl(locator()),
    );
  }
}
