import 'package:deposit_core/domain/entities/deposit.dart';
import 'package:deposit_core/domain/usecases/deposit_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'deposit_watcher_bloc.freezed.dart';
part 'deposit_watcher_event.dart';
part 'deposit_watcher_state.dart';

class DepositWatcherBloc
    extends Bloc<DepositWatcherEvent, DepositWatcherState> {
  DepositWatcherBloc(this._usecase)
      : super(const DepositWatcherState.initial()) {
    on<DepositWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          page = 1;
          localList.clear();
          emit(const DepositWatcherState.loading());
          final result = await _usecase.getDepositList(
            page: page,
            status: event.indexFilter == 1
                ? 'pending'
                : event.indexFilter == 2
                    ? 'success'
                    : event.indexFilter == 3
                        ? 'failed'
                        : '',
          );
          result.fold(
            (f) => emit(DepositWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        refresh: (event) async {
          page = 1;
          localList.clear();
          final result = await _usecase.getDepositList(
            page: page,
            status: event.indexFilter == 1
                ? 'pending'
                : event.indexFilter == 2
                    ? 'success'
                    : event.indexFilter == 3
                        ? 'failed'
                        : '',
          );
          result.fold(
            (f) => emit(DepositWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        next: (_) async {
          page += 1;
          final result = await _usecase.getDepositList(
            page: page,
            status: event.indexFilter == 1
                ? 'pending'
                : event.indexFilter == 2
                    ? 'success'
                    : event.indexFilter == 3
                        ? 'failed'
                        : '',
          );
          result.fold(
            (f) => emit(DepositWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
      );
    });
  }

  void _savingDataToLocal(
    List<Deposit> data,
    Emitter<DepositWatcherState> emit,
  ) {
    final list = List.of(localList)..addAll(data);
    localList.addAll(data);
    if (data.length < 10) {
      emit(
        DepositWatcherState.loaded(
          hasReachedMax: true,
          depositList: list,
        ),
      );
    } else {
      emit(
        DepositWatcherState.loaded(
          hasReachedMax: false,
          depositList: list,
        ),
      );
    }
  }

  int page = 1;
  final localList = <Deposit>[];
  final DepositUsecase _usecase;
}
