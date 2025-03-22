import 'package:shared_libraries/equatable/equatable.dart';

class AddressDetail extends Equatable {
  const AddressDetail({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.street,
  });

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final double latitude;
  final double longitude;
  final AddressDetailStreet street;

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

class AddressDetailStreet extends Equatable {
  const AddressDetailStreet({
    required this.id,
    required this.street,
  });

  final int id;
  final String street;

  @override
  List<Object?> get props => [];
}
