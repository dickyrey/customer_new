import 'package:product_core/domain/entities/product.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        price: json['price'] as int,
        stock: json['stock'] as int,
      );

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
      stock: stock,
    );
  }

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
