import 'package:address_core/data/data_sources/address_data_source.dart';
import 'package:address_core/domain/repositories/address_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_libraries/geolocator/geolocator.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    AddressDataSource,
    AddressRepository,
    GeolocatorPlatform,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
