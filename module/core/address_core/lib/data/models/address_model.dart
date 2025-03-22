import 'package:address_core/data/models/street_model.dart';
import 'package:address_core/domain/entities/address.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class AddressModel extends Equatable {
  const AddressModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.street,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'] as int,
        name: json['name'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String,
        type: json['type'] as String,
        street: StreetModel.fromJson(
          json['street'] as Map<String, dynamic>,
        ),
      );

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final StreetModel street;

  Address toEntity() {
    return Address(
      id: id,
      name: name,
      phone: phone,
      address: address,
      type: type,
      street: street.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        type,
      ];
}
