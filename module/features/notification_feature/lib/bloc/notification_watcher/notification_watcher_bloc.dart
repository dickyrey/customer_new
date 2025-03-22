import 'package:notification_core/domain/entities/notification.dart';
import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'notification_watcher_bloc.freezed.dart';
part 'notification_watcher_event.dart';
part 'notification_watcher_state.dart';

class NotificationWatcherBloc
    extends Bloc<NotificationWatcherEvent, NotificationWatcherState> {
  NotificationWatcherBloc(this._usecase)
      : super(const NotificationWatcherState.initial()) {
    on<NotificationWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          page = 1;
          localList.clear();
          emit(const NotificationWatcherState.loading());
          final result = await _usecase.getNotificationList(
            page: page,
            type: event.indexFilter == 1
                ? 'security'
                : event.indexFilter == 2
                    ? 'transaction'
                    : event.indexFilter == 3
                        ? 'promotion'
                        : '',
          );
          result.fold(
            (f) => emit(NotificationWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        refresh: (event) async {
          page = 1;
          localList.clear();
          final result = await _usecase.getNotificationList(
            page: page,
            type: event.indexFilter == 1
                ? 'security'
                : event.indexFilter == 2
                    ? 'transaction'
                    : event.indexFilter == 3
                        ? 'promotion'
                        : '',
          );
          result.fold(
            (f) => emit(NotificationWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        next: (_) async {
          page += 1;
          final result = await _usecase.getNotificationList(
            page: page,
            type: event.indexFilter == 1
                ? 'security'
                : event.indexFilter == 2
                    ? 'transaction'
                    : event.indexFilter == 3
                        ? 'promotion'
                        : '',
          );
          result.fold(
            (f) => emit(NotificationWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
      );
    });
  }

  void _savingDataToLocal(
    List<Notifications> data,
    Emitter<NotificationWatcherState> emit,
  ) {
    final list = List.of(localList)..addAll(data);
    localList.addAll(data);
    if (data.length < 10) {
      emit(
        NotificationWatcherState.loaded(
          hasReachedMax: true,
          notificationList: list,
        ),
      );
    } else {
      emit(
        NotificationWatcherState.loaded(
          hasReachedMax: false,
          notificationList: list,
        ),
      );
    }
  }

  int page = 1;
  final localList = <Notifications>[];
  final NotificationUsecase _usecase;
}
