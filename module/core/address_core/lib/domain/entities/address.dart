import 'package:address_core/domain/entities/street.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class Address extends Equatable {
  const Address({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.type,
    required this.street,
  });

  final int id;
  final String name;
  final String phone;
  final String address;
  final String type;
  final Street street;

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        address,
        type,
        street,
      ];
}
