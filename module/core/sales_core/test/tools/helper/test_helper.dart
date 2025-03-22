import 'package:mockito/annotations.dart';
import 'package:sales_core/data/data_sources/sales_data_source.dart';
import 'package:sales_core/domain/repositories/sales_repository.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    SalesDataSource,
    SalesRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
