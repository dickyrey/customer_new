import 'package:address_core/data/models/street_model.dart';
import 'package:address_core/domain/entities/street.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tModel = StreetModel(
    id: 6,
    street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
  );

  const tEntity = Street(
    id: 6,
    street: 'Jl. Diponegoro,. Kantor,. Delta Pawan',
  );

  test('should be a subclass of entity', () async {
    final result = tModel.toEntity();
    expect(result, tEntity);
  });
}
