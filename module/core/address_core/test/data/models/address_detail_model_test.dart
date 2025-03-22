import 'package:address_core/data/models/address_detail_model.dart';
import 'package:address_core/domain/entities/address_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tModel = AddressDetailModel(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    latitude: -1.6819289,
    longitude: 109.2648223,
    street: AddressDetailStreetModel(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  const tEntity = AddressDetail(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    latitude: -1.6819289,
    longitude: 109.2648223,
    street: AddressDetailStreet(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  test('should be a subclass of entity', () async {
    final result = tModel.toEntity();
    expect(result, tEntity);
  });
}
