part of 'address_delete_actor_bloc.dart';

@freezed
class AddressDeleteActorEvent with _$AddressDeleteActorEvent {
  const factory AddressDeleteActorEvent.delete(int id) = _Delete;
}
