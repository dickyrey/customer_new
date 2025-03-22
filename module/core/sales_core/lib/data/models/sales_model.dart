import 'package:sales_core/domain/entities/sales.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SalesModel extends Equatable {
  const SalesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      rating: json['rating'] as int,
    );
  }

  final int id;
  final String name;
  final String image;
  final int rating;

  Sales toEntity() {
    return Sales(
      id: id,
      name: name,
      image: image,
      rating: rating,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        rating,
      ];
}
