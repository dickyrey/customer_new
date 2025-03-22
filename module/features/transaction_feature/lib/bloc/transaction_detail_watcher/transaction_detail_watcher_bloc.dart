import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'transaction_detail_watcher_bloc.freezed.dart';
part 'transaction_detail_watcher_event.dart';
part 'transaction_detail_watcher_state.dart';

class TransactionDetailWatcherBloc
    extends Bloc<TransactionDetailWatcherEvent, TransactionDetailWatcherState> {
  TransactionDetailWatcherBloc(this._usecase)
      : super(const TransactionDetailWatcherState.initial()) {
    on<TransactionDetailWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const TransactionDetailWatcherState.loading());
          final result = await _usecase.getTransactionDetail(event.id);
          result.fold(
            (f) => emit(TransactionDetailWatcherState.error(f.message)),
            (data) => emit(TransactionDetailWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final TransactionUsecase _usecase;
}
