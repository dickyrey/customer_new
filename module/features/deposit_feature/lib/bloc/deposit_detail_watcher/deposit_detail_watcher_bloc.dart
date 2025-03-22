import 'package:deposit_core/domain/entities/deposit_detail.dart';
import 'package:deposit_core/domain/usecases/deposit_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'deposit_detail_watcher_bloc.freezed.dart';
part 'deposit_detail_watcher_event.dart';
part 'deposit_detail_watcher_state.dart';

class DepositDetailWatcherBloc
    extends Bloc<DepositDetailWatcherEvent, DepositDetailWatcherState> {
  DepositDetailWatcherBloc(this._usecase)
      : super(const DepositDetailWatcherState.initial()) {
    on<DepositDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const DepositDetailWatcherState.loading());
          final result = await _usecase.getDepositDetail(event.id);
          result.fold(
            (f) => emit(DepositDetailWatcherState.error(f.message)),
            (data) => emit(DepositDetailWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final DepositUsecase _usecase;
}
