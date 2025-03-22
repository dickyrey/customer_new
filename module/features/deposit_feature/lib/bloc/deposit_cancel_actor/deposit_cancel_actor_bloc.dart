import 'package:deposit_core/domain/usecases/deposit_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'deposit_cancel_actor_bloc.freezed.dart';
part 'deposit_cancel_actor_event.dart';
part 'deposit_cancel_actor_state.dart';

class DepositCancelActorBloc
    extends Bloc<DepositCancelActorEvent, DepositCancelActorState> {
  DepositCancelActorBloc(this._usecase)
      : super(const DepositCancelActorState.initial()) {
    on<DepositCancelActorEvent>((event, emit) async {
      await event.map(
        delete: (event) async {
          emit(const DepositCancelActorState.loading());
          final result = await _usecase.cancelDeposit(event.id);
          result.fold(
            (f) => emit(DepositCancelActorState.error(f.message)),
            (data) => emit(const DepositCancelActorState.success()),
          );
        },
      );
    });
  }
  final DepositUsecase _usecase;
}
