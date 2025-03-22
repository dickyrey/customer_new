import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'address_setdefault_actor_event.dart';
part 'address_setdefault_actor_state.dart';
part 'address_setdefault_actor_bloc.freezed.dart';

class AddressSetdefaultActorBloc
    extends Bloc<AddressSetdefaultActorEvent, AddressSetdefaultActorState> {
  AddressSetdefaultActorBloc(this._usecase)
      : super(const AddressSetdefaultActorState.initial()) {
    on<AddressSetdefaultActorEvent>((event, emit) async {
      await event.map(
        setDefault: (event) async {
          emit(const AddressSetdefaultActorState.loading());
          final result = await _usecase.setDefault(event.id);
          result.fold(
            (f) {
              emit(AddressSetdefaultActorState.failed(f.message));
            },
            (data) {
              emit(const AddressSetdefaultActorState.loaded());
            },
          );
        },
      );
    });
  }
  final AddressUsecase _usecase;
}
