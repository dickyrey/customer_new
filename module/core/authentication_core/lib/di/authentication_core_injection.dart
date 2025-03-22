import 'package:authentication_core/data/data_sources/authentication_data_source.dart';
import 'package:authentication_core/data/repositories/authentication_repository_impl.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:authentication_core/domain/usecases/authentication_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class AuthenticationCoreInjection {
  AuthenticationCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<AuthenticationUsecase>(
      () => AuthenticationUsecaseImpl(locator()),
    );
  }
}
