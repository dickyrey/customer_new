import 'package:deposit_core/data/data_sources/deposit_data_source.dart';
import 'package:deposit_core/domain/repositories/deposit_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    DepositDataSource,
    DepositRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
