import 'package:address_core/data/models/address_model.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class AddressResponse extends Equatable {
  const AddressResponse({
    required this.addressList,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      addressList: List<AddressModel>.from(
        (json['data'] as List)
            .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
            .where((element) => element.id.toString() != ''),
      ),
    );
  }

  final List<AddressModel> addressList;

  @override
  List<Object?> get props => [addressList];
}
