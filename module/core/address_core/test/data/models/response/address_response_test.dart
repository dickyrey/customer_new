import 'dart:convert';

import 'package:address_core/data/models/address_model.dart';
import 'package:address_core/data/models/responses/address_response.dart';
import 'package:address_core/data/models/street_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

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

  const tResponseModel = AddressResponse(
    addressList: <AddressModel>[tModel],
  );
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonString = readJson('tools/dummy_data/address_list.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = AddressResponse.fromJson(jsonMap);
      // assert
      expect(
        result.addressList.first,
        tResponseModel.addressList.first,
      );
      expect(
        result.addressList.first,
        tResponseModel.addressList.first,
      );
      expect(
        result.addressList.first,
        tResponseModel.addressList.first,
      );
    });
  });
}
