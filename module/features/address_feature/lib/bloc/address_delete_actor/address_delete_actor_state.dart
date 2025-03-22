part of 'address_delete_actor_bloc.dart';

@freezed
class AddressDeleteActorState with _$AddressDeleteActorState {
  const factory AddressDeleteActorState.initial() = _Initial;
  const factory AddressDeleteActorState.loading() = _Lading;
  const factory AddressDeleteActorState.failed(String message) = _Failed;
  const factory AddressDeleteActorState.loaded() = _Loaded;
}
