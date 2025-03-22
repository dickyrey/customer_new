import 'package:address_core/data/models/street_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class StreetResponse extends Equatable {
  const StreetResponse({
    required this.streetList,
  });

  factory StreetResponse.fromJson(Map<String, dynamic> json) {
    return StreetResponse(
      streetList: List<StreetModel>.from(
        (json['data'] as List)
            .map((e) => StreetModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<StreetModel> streetList;

  @override
  List<Object?> get props => [streetList];
}
