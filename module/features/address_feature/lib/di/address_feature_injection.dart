import 'package:address_feature/bloc/address_delete_actor/address_delete_actor_bloc.dart';
import 'package:address_feature/bloc/address_form/address_form_bloc.dart';
import 'package:address_feature/bloc/address_setdefault_actor/address_setdefault_actor_bloc.dart';
import 'package:address_feature/bloc/address_watcher/address_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class AddressFeatureInjection {
  AddressFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator
      ..registerLazySingleton(
        () => AddressDeleteActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => AddressFormBloc(locator()),
      )
      ..registerLazySingleton(
        () => AddressSetdefaultActorBloc(locator()),
      )
      ..registerLazySingleton(
        () => AddressWatcherBloc(locator()),
      );
  }
}
