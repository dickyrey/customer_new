import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';
import 'package:transaction_core/domain/entities/transaction_detail.dart';
import 'package:transaction_core/domain/usecases/transaction_usecase.dart';

part 'transaction_confirm_actor_event.dart';
part 'transaction_confirm_actor_state.dart';
part 'transaction_confirm_actor_bloc.freezed.dart';

class TransactionConfirmActorBloc
    extends Bloc<TransactionConfirmActorEvent, TransactionConfirmActorState> {
  TransactionConfirmActorBloc(this._usecase)
      : super(const TransactionConfirmActorState.initial()) {
    on<TransactionConfirmActorEvent>((event, emit) async {
      await event.map(
        confirm: (event) async {
          emit(const TransactionConfirmActorState.loading());
          final result = await _usecase.completeTransaction(event.id);
          result.fold(
            (f) => emit(TransactionConfirmActorState.error(f.message)),
            (data) => emit(TransactionConfirmActorState.success(data)),
          );
        },
      );
    });
  }
  final TransactionUsecase _usecase;
}
