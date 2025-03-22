import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/usecases/address_usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/freezed_annotation/freezed_annotation.dart';

part 'address_watcher_event.dart';
part 'address_watcher_state.dart';
part 'address_watcher_bloc.freezed.dart';

class AddressWatcherBloc
    extends Bloc<AddressWatcherEvent, AddressWatcherState> {
  AddressWatcherBloc(this._usecase)
      : super(const AddressWatcherState.initial()) {
    on<AddressWatcherEvent>(
      (event, emit) async {
        await event.map(
          fetch: (_) async {
            emit(const AddressWatcherState.loading());
            final result = await _usecase.getAddressList();
            result.fold(
              (f) {
                emit(AddressWatcherState.failed(f.message));
              },
              (data) {
                emit(AddressWatcherState.loaded(data));
              },
            );
          },
        );
      },
    );
  }
  final AddressUsecase _usecase;
}
