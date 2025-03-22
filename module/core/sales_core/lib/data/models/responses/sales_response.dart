import 'package:sales_core/data/models/sales_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SalesResponse extends Equatable {
  const SalesResponse({
    required this.salesList,
  });

  factory SalesResponse.fromJson(Map<String, dynamic> json) {
    return SalesResponse(
      salesList: List<SalesModel>.from(
        (json['data'] as List)
            .map((e) => SalesModel.fromJson(e as Map<String, dynamic>)),
      ),
    );
  }

  final List<SalesModel> salesList;

  @override
  List<Object?> get props => [salesList];
}
