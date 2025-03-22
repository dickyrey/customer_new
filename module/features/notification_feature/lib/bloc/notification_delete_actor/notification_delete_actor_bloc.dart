import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'notification_delete_actor_bloc.freezed.dart';
part 'notification_delete_actor_event.dart';
part 'notification_delete_actor_state.dart';

class NotificationDeleteActorBloc
    extends Bloc<NotificationDeleteActorEvent, NotificationDeleteActorState> {
  NotificationDeleteActorBloc(this._usecase)
      : super(const NotificationDeleteActorState.initial()) {
    on<NotificationDeleteActorEvent>((event, emit) async {
      await event.map(
        delete: (event) async {
          emit(const NotificationDeleteActorState.loading());
          final result = await _usecase.deleteNotification(event.id);
          result.fold(
            (f) => emit(NotificationDeleteActorState.error(f.message)),
            (data) => emit(const NotificationDeleteActorState.success()),
          );
        },
        deleteAll: (event) async {
          emit(const NotificationDeleteActorState.loading());
          final result = await _usecase.deleteNotification(0);
          result.fold(
            (f) => emit(NotificationDeleteActorState.error(f.message)),
            (data) => emit(const NotificationDeleteActorState.success()),
          );
        },
      );
    });
  }
  final NotificationUsecase _usecase;
}
