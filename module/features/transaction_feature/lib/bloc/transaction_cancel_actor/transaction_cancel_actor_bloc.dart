import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'transaction_cancel_actor_event.dart';
part 'transaction_cancel_actor_state.dart';
part 'transaction_cancel_actor_bloc.freezed.dart';

class TransactionCancelActorBloc
    extends Bloc<TransactionCancelActorEvent, TransactionCancelActorState> {
  TransactionCancelActorBloc(this._usecase)
      : super(const TransactionCancelActorState.initial()) {
    on<TransactionCancelActorEvent>((event, emit) async {
      await event.map(
        cancel: (event) async {
          emit(const TransactionCancelActorState.loading());
          final result = await _usecase.cancelTransaction(event.id);
          result.fold(
            (f) => emit(TransactionCancelActorState.error(f.message)),
            (data) => emit(const TransactionCancelActorState.success()),
          );
        },
      );
    });
  }
  final TransactionUsecase _usecase;
}
