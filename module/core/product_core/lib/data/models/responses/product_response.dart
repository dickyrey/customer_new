import 'package:product_core/data/models/product_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class ProductResponse extends Equatable {
  const ProductResponse({
    required this.productList,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      productList: List<ProductModel>.from(
        (json['data'] as List)
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<ProductModel> productList;

  @override
  List<Object?> get props => [productList];
}
