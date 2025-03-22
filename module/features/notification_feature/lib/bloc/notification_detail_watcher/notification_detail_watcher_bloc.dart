import 'package:notification_core/domain/entities/notification_detail.dart';
import 'package:notification_core/domain/usecases/notification_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'notification_detail_watcher_bloc.freezed.dart';
part 'notification_detail_watcher_event.dart';
part 'notification_detail_watcher_state.dart';

class NotificationDetailWatcherBloc extends Bloc<NotificationDetailWatcherEvent,
    NotificationDetailWatcherState> {
  NotificationDetailWatcherBloc(this._usecase)
      : super(const NotificationDetailWatcherState.initial()) {
    on<NotificationDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const NotificationDetailWatcherState.loading());
          final result = await _usecase.getNotificationDetail(event.id);
          result.fold(
            (f) => emit(NotificationDetailWatcherState.error(f.message)),
            (data) => emit(NotificationDetailWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final NotificationUsecase _usecase;
}
