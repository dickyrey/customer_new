import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'review_transaction_watcher_event.dart';
part 'review_transaction_watcher_state.dart';
part 'review_transaction_watcher_bloc.freezed.dart';

class ReviewTransactionWatcherBloc
    extends Bloc<ReviewTransactionWatcherEvent, ReviewTransactionWatcherState> {
  ReviewTransactionWatcherBloc(this._usecase)
      : super(const ReviewTransactionWatcherState.initial()) {
    on<ReviewTransactionWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (event) async {
          emit(const ReviewTransactionWatcherState.loading());
          final result = await _usecase.getTransactionDetail(event.id);
          result.fold(
            (f) => emit(ReviewTransactionWatcherState.error(f.message)),
            (data) => emit(ReviewTransactionWatcherState.loaded(data)),
          );
        },
      );
    });
  }
  final TransactionUsecase _usecase;
}
