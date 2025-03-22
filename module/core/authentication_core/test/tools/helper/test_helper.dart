import 'package:authentication_core/data/data_sources/authentication_data_source.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    AuthenticationDataSource,
    AuthenticationRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
