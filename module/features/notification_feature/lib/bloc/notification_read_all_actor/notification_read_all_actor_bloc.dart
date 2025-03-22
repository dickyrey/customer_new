import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'notification_read_all_actor_bloc.freezed.dart';
part 'notification_read_all_actor_event.dart';
part 'notification_read_all_actor_state.dart';

class NotificationReadAllActorBloc
    extends Bloc<NotificationReadAllActorEvent, NotificationReadAllActorState> {
  NotificationReadAllActorBloc(this._usecase)
      : super(const NotificationReadAllActorState.initial()) {
    on<NotificationReadAllActorEvent>((event, emit) async {
      await event.map(
        readAll: (event) async {
          emit(const NotificationReadAllActorState.loading());
          final result = await _usecase.readAllNotification();
          result.fold(
            (f) => emit(NotificationReadAllActorState.error(f.message)),
            (data) => emit(const NotificationReadAllActorState.success()),
          );
        },
      );
    });
  }
  final NotificationUsecase _usecase;
}
