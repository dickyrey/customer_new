import 'package:address_core/data/models/address_model.dart';
import 'package:address_core/data/models/street_model.dart';
import 'package:address_core/domain/entities/address.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tModel = AddressModel(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    street: StreetModel(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  const tEntity = Address(
    id: 27,
    name: 'Hanny Novianty',
    phone: '628994577907',
    address: 'Gg, Hj Deralib No. 10',
    type: 'home',
    street: Street(
      id: 6,
      street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
    ),
  );

  test('should be a subclass of entity', () async {
    final result = tModel.toEntity();
    expect(result, tEntity);
  });
}
