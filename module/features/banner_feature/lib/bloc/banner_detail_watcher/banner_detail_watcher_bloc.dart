import 'package:banner_core/domain/entities/banner_detail.dart';
import 'package:banner_core/domain/usecases/banner_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'banner_detail_watcher_event.dart';
part 'banner_detail_watcher_state.dart';
part 'banner_detail_watcher_bloc.freezed.dart';

class BannerDetailWatcherBloc
    extends Bloc<BannerDetailWatcherEvent, BannerDetailWatcherState> {
  BannerDetailWatcherBloc(this._usecase)
      : super(const BannerDetailWatcherState.initial()) {
    on<BannerDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (_) async {
          emit(const BannerDetailWatcherState.loading());
          final result = await _usecase.getBannerDetail(event.id);
          result.fold(
            (f) {
              emit(BannerDetailWatcherState.failed(f.message));
            },
            (data) {
              emit(BannerDetailWatcherState.loaded(data));
            },
          );
        },
      );
    });
  }
  final BannerUsecase _usecase;
}
