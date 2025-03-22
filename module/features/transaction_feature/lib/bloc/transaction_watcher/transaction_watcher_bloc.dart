import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/entities/transaction.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'transaction_watcher_bloc.freezed.dart';
part 'transaction_watcher_event.dart';
part 'transaction_watcher_state.dart';

class TransactionWatcherBloc
    extends Bloc<TransactionWatcherEvent, TransactionWatcherState> {
  TransactionWatcherBloc(this._usecase)
      : super(const TransactionWatcherState.initial()) {
    on<TransactionWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          page = 1;
          localList.clear();
          emit(const TransactionWatcherState.loading());
          final result = await _usecase.getTransactionList(
            page: page,
            status: event.indexFilter == 1
                ? 'delivery'
                : event.indexFilter == 2
                    ? 'success'
                    : '',
          );
          result.fold(
            (f) => emit(TransactionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        refresh: (event) async {
          page = 1;
          localList.clear();
          final result = await _usecase.getTransactionList(
            page: page,
            status: event.indexFilter == 1
                ? 'delivery'
                : event.indexFilter == 2
                    ? 'success'
                    : '',
          );
          result.fold(
            (f) => emit(TransactionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
        next: (_) async {
          page += 1;
          final result = await _usecase.getTransactionList(
            page: page,
            status: event.indexFilter == 1
                ? 'delivery'
                : event.indexFilter == 2
                    ? 'success'
                    : '',
          );
          result.fold(
            (f) => emit(TransactionWatcherState.failed(f.message)),
            (data) => _savingDataToLocal(data, emit),
          );
        },
      );
    });
  }

  void _savingDataToLocal(
    List<Transaction> data,
    Emitter<TransactionWatcherState> emit,
  ) {
    final list = List.of(localList)..addAll(data);
    localList.addAll(data);
    if (data.length < 10) {
      emit(
        TransactionWatcherState.loaded(
          hasReachedMax: true,
          transactionList: list,
        ),
      );
    } else {
      emit(
        TransactionWatcherState.loaded(
          hasReachedMax: false,
          transactionList: list,
        ),
      );
    }
  }

  int page = 1;
  final localList = <Transaction>[];
  final TransactionUsecase _usecase;
}
