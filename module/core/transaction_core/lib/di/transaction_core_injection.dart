import 'package:shared_libraries/get_it/get_it.dart';
import 'package:transaction_core/data/data_sources/transaction_data_source.dart';
import 'package:transaction_core/data/repositories/transaction_repository_impl.dart';
import 'package:transaction_core/domain/repositories/transaction_repository.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

class TransactionCoreInjection {
  TransactionCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<TransactionDataSource>(
      () => TransactionDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<TransactionUsecase>(
      () => TransactionUsecaseImpl(locator()),
    );
  }
}
