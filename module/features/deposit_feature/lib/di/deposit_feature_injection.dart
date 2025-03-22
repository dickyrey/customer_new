import 'package:deposit_feature/bloc/deposit_cancel_actor/deposit_cancel_actor_bloc.dart';
import 'package:deposit_feature/bloc/deposit_detail_watcher/deposit_detail_watcher_bloc.dart';
import 'package:deposit_feature/bloc/deposit_top_up_form/deposit_top_up_form_bloc.dart';
import 'package:deposit_feature/bloc/deposit_watcher/deposit_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class DepositFeatureInjection {
  DepositFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => DepositCancelActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => DepositDetailWatcherBloc(locator()),
      )
      ..registerLazySingleton(
        () => DepositTopUpFormBloc(locator()),
      )
      ..registerLazySingleton(
        () => DepositWatcherBloc(locator()),
      );
  }
}
