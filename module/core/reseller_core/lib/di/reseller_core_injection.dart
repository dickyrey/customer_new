import 'package:reseller_core/data/data_sources/reseller_data_source.dart';
import 'package:reseller_core/data/repositories/reseller_repository_impl.dart';
import 'package:reseller_core/domain/repositories/reseller_repository.dart';
import 'package:reseller_core/domain/usecases/reseller_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class ResellerCoreInjection {
  ResellerCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<ResellerDataSource>(
      () => ResellerDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<ResellerRepository>(
      () => ResellerRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<ResellerUsecase>(
      () => ResellerUsecaseImpl(locator()),
    );
  }
}
