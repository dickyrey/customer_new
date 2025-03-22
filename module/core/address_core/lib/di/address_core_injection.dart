import 'package:address_core/data/data_sources/address_data_source.dart';
import 'package:address_core/data/repositories/address_repository_impl.dart';
import 'package:address_core/domain/repositories/address_repository.dart';
import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class AddressCoreInjection {
  AddressCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<AddressDataSource>(
      () => AddressDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<AddressUsecase>(
      () => AddressUsecaseImpl(locator()),
    );
  }
}
