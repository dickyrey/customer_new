part of 'address_setdefault_actor_bloc.dart';

@freezed
class AddressSetdefaultActorState with _$AddressSetdefaultActorState {
  const factory AddressSetdefaultActorState.initial() = _Initial;
  const factory AddressSetdefaultActorState.loading() = _Lading;
  const factory AddressSetdefaultActorState.failed(String message) = _Failed;
  const factory AddressSetdefaultActorState.loaded() = _Loaded;
}
