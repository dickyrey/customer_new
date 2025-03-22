import 'dart:convert';

import 'package:address_core/data/models/address_detail_model.dart';
import 'package:address_core/data/models/responses/address_detail_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_utilities/json_reader/json_reader.dart';

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

  const tResponseModel = AddressDetailResponse(
    address: tModel,
  );
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final jsonString = readJson('tools/dummy_data/address_show.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = AddressDetailResponse.fromJson(jsonMap);
      // assert
      expect(
        result.address,
        tResponseModel.address,
      );
    });
  });
}
