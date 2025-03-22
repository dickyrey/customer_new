import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class AuthenticationFeatureInjection {
  AuthenticationFeatureInjection() {
    _bloc();
  }
  void _bloc() {
    locator.registerLazySingleton(
      () => AuthWatcherBloc(
        locator(),
        locator(),
      ),
    );
  }
}
