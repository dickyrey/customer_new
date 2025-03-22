import 'package:deposit_core/data/data_sources/deposit_data_source.dart';
import 'package:deposit_core/data/repositories/deposit_repository_impl.dart';
import 'package:deposit_core/domain/repositories/deposit_repository.dart';
import 'package:deposit_core/domain/usecases/deposit_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class DepositCoreInjection {
  DepositCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<DepositDataSource>(
      () => DepositDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<DepositRepository>(
      () => DepositRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<DepositUsecase>(
      () => DepositUsecaseImpl(locator()),
    );
  }
}
