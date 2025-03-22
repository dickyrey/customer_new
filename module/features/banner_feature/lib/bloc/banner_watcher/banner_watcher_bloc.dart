import 'package:banner_core/domain/entities/banner.dart';
import 'package:banner_core/domain/usecases/banner_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'banner_watcher_bloc.freezed.dart';
part 'banner_watcher_event.dart';
part 'banner_watcher_state.dart';

class BannerWatcherBloc extends Bloc<BannerWatcherEvent, BannerWatcherState> {
  BannerWatcherBloc(this._usecase) : super(const BannerWatcherState.initial()) {
    on<BannerWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (_) async {
          emit(const BannerWatcherState.loading());
          final result = await _usecase.getBannerList();
          result.fold((f) {
            emit(BannerWatcherState.failed(f.message));
          }, (data) {
            emit(BannerWatcherState.loaded(data));
          });
        },
      );
    });
  }
  final BannerUsecase _usecase;
}
