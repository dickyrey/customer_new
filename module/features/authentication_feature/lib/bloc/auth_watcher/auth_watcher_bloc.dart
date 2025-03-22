import 'package:authentication_core/domain/usecases/authentication_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:shared_libraries/onesignal_flutter/onesignal_flutter.dart';
import 'package:user_core/domain/entities/user.dart';
import 'package:user_core/domain/usecases/user_usecase.dart';

part 'auth_watcher_bloc.freezed.dart';
part 'auth_watcher_event.dart';
part 'auth_watcher_state.dart';

class AuthWatcherBloc extends Bloc<AuthWatcherEvent, AuthWatcherState> {
  AuthWatcherBloc(
    this._userCase,
    this._authCase,
  ) : super(const AuthWatcherState.initial()) {
    on<AuthWatcherEvent>((event, emit) async {
      await event.map(
        check: (_) async {
          emit(const AuthWatcherState.authInProgress());
          final result = await _userCase.getCurrentUser();
          result.fold(
            (f) => emit(AuthWatcherState.authInFailure(f.message)),
            (data) {
              OneSignal.login(data.phone);
              emit(AuthWatcherState.authenticated(data));
            },
          );
        },
        signOut: (_) async {
          emit(const AuthWatcherState.authInProgress());
          final result = await _authCase.signOut();
          result.fold(
            (f) => emit(AuthWatcherState.authInFailure(f.message)),
            (data) {
              OneSignal.logout();
              emit(const AuthWatcherState.notAuthenticated());
            },
          );
        },
      );
    });
  }
  final UserUsecase _userCase;
  final AuthenticationUsecase _authCase;
}
