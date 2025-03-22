import 'package:payment_core/data/data_sources/payment_data_source.dart';
import 'package:payment_core/data/repositories/payment_repository_impl.dart';
import 'package:payment_core/domain/repositories/payment_repository.dart';
import 'package:payment_core/domain/usecases/payment_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class PaymentCoreInjection {
  PaymentCoreInjection() {
    _datasources();
    _repositories();
    _usecases();
  }
  void _datasources() {
    locator.registerLazySingleton<PaymentDataSource>(
      () => PaymentDataSourceImpl(locator()),
    );
  }

  void _repositories() {
    locator.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(locator()),
    );
  }

  void _usecases() {
    locator.registerLazySingleton<PaymentUsecase>(
      () => PaymentUsecaseImpl(locator()),
    );
  }
}
