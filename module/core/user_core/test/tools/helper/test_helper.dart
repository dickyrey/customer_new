import 'package:mockito/annotations.dart';
import 'package:shared_libraries/http/http.dart' as http;
import 'package:user_core/data/data_sources/user_data_source.dart';
import 'package:user_core/domain/repositories/user_repository.dart';

@GenerateMocks(
  [
    UserDataSource,
    UserRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
