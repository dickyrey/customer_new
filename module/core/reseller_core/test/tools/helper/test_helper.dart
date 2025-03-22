import 'package:mockito/annotations.dart';
import 'package:reseller_core/data/data_sources/reseller_data_source.dart';
import 'package:reseller_core/domain/repositories/reseller_repository.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    ResellerDataSource,
    ResellerRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
