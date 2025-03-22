import 'package:address_core/data/models/address_detail_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class AddressDetailResponse extends Equatable {
  const AddressDetailResponse({
    required this.address,
  });

  factory AddressDetailResponse.fromJson(Map<String, dynamic> json) {
    return AddressDetailResponse(
      address: AddressDetailModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AddressDetailModel address;

  @override
  List<Object?> get props => [address];
}
