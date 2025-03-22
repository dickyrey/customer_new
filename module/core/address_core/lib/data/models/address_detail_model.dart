import 'package:address_core/domain/entities/address_detail.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class AddressDetailModel extends Equatable {
  const AddressDetailModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.street,
  });

  factory AddressDetailModel.fromJson(Map<String, dynamic> json) {
    final latitude = json['latitude'] == 0 ? 0.0 : json['latitude'];
    final longitude = json['longitude'] == 0 ? 0.0 : json['longitude'];
    return AddressDetailModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      latitude: latitude as double,
      longitude: longitude as double,
      street: AddressDetailStreetModel.fromJson(
        json['street'] as Map<String, dynamic>,
      ),
    );
  }

  AddressDetail toEntity() {
    return AddressDetail(
      id: id,
      name: name,
      phone: phone,
      address: address,
      type: type,
      latitude: latitude,
      longitude: longitude,
      street: street.toEntity(),
    );
  }

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final double latitude;
  final double longitude;
  final AddressDetailStreetModel street;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        type,
        latitude,
        longitude,
        street,
      ];
}

class AddressDetailStreetModel extends Equatable {
  const AddressDetailStreetModel({
    required this.id,
    required this.street,
  });

  factory AddressDetailStreetModel.fromJson(Map<String, dynamic> json) =>
      AddressDetailStreetModel(
        id: json['id'] as int,
        street: json['street'] as String,
      );

  AddressDetailStreet toEntity() {
    return AddressDetailStreet(
      id: id,
      street: street,
    );
  }

  final int id;
  final String street;

  @override
  List<Object?> get props => [];
}
