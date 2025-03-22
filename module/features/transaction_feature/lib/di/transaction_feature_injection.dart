import 'package:shared_libraries/get_it/get_it.dart';
import 'package:transaction_feature/bloc/transaction_cancel_actor/transaction_cancel_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_confirm_actor/transaction_confirm_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_detail_watcher/transaction_detail_watcher_bloc.dart';
import 'package:transaction_feature/bloc/transaction_watcher/transaction_watcher_bloc.dart';

class TransactionFeatureInjection {
  TransactionFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => TransactionCancelActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => TransactionConfirmActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => TransactionDetailWatcherBloc(locator()),
      )
      ..registerLazySingleton(
        () => TransactionWatcherBloc(locator()),
      );
  }
}
