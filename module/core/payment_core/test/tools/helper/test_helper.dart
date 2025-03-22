import 'package:mockito/annotations.dart';
import 'package:payment_core/data/data_sources/payment_data_source.dart';
import 'package:payment_core/domain/repositories/payment_repository.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    PaymentDataSource,
    PaymentRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
