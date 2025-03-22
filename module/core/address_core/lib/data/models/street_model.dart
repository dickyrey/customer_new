import 'package:address_core/domain/entities/street.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class StreetModel extends Equatable {
  const StreetModel({
    required this.id,
    required this.street,
  });

  factory StreetModel.fromJson(Map<String, dynamic> json) => StreetModel(
        id: json['id'] as int,
        street: json['street'] as String,
      );

  Street toEntity() {
    return Street(
      id: id,
      street: street,
    );
  }

  final int id;
  final String street;

  @override
  List<Object?> get props => [
        id,
        street,
      ];
}
