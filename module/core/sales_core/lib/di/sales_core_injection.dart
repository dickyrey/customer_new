import 'package:sales_core/data/data_sources/sales_data_source.dart';
import 'package:sales_core/data/repositories/sales_repository_impl.dart';
import 'package:sales_core/domain/repositories/sales_repository.dart';
import 'package:sales_core/domain/usecases/sales_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class SalesCoreInjection {
  SalesCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<SalesDataSource>(
      () => SalesDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<SalesRepository>(
      () => SalesRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<SalesUsecase>(
      () => SalesUsecaseImpl(locator()),
    );
  }
}
