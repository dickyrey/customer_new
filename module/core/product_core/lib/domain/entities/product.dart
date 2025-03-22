import 'package:shared_libraries/equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.stock,
  });

  final int id;
  final String name;
  final String image;
  final int price;
  final int stock;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        price,
        stock,
      ];
}
