import 'package:mockito/annotations.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:transaction_core/data/data_sources/transaction_data_source.dart';
import 'package:transaction_core/domain/repositories/transaction_repository.dart';

@GenerateMocks(
  [
    TransactionDataSource,
    TransactionRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
