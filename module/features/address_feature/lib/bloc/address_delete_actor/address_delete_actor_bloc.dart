import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'address_delete_actor_event.dart';
part 'address_delete_actor_state.dart';
part 'address_delete_actor_bloc.freezed.dart';

class AddressDeleteActorBloc
    extends Bloc<AddressDeleteActorEvent, AddressDeleteActorState> {
  AddressDeleteActorBloc(this._usecase)
      : super(const AddressDeleteActorState.initial()) {
    on<AddressDeleteActorEvent>((event, emit) async {
      await event.map(
        delete: (event) async {
          emit(const AddressDeleteActorState.loading());
          final result = await _usecase.deleteAddress(event.id);
          result.fold(
            (f) {
              emit(AddressDeleteActorState.failed(f.message));
            },
            (data) {
              emit(const AddressDeleteActorState.loaded());
            },
          );
        },
      );
    });
  }
  final AddressUsecase _usecase;
}
