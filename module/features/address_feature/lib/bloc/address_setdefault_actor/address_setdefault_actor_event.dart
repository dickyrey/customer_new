part of 'address_setdefault_actor_bloc.dart';

@freezed
class AddressSetdefaultActorEvent with _$AddressSetdefaultActorEvent {
  const factory AddressSetdefaultActorEvent.setDefault(int id) = _SetDefault;
}
