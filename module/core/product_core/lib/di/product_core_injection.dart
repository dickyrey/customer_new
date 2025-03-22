import 'package:product_core/data/data_sources/product_data_source.dart';
import 'package:product_core/data/repositories/product_repository_impl.dart';
import 'package:product_core/domain/repositories/product_repository.dart';
import 'package:product_core/domain/usecases/product_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class ProductCoreInjection {
  ProductCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<ProductDataSource>(
      () => ProductDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<ProductUsecase>(
      () => ProductUsecaseImpl(locator()),
    );
  }
}
