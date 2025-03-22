import 'package:mockito/annotations.dart';
import 'package:product_core/data/data_sources/product_data_source.dart';
import 'package:product_core/domain/repositories/product_repository.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    ProductDataSource,
    ProductRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
