import 'package:banner_core/data/data_sources/banner_data_source.dart';
import 'package:banner_core/domain/repositories/banner_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    BannerDataSource,
    BannerRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
