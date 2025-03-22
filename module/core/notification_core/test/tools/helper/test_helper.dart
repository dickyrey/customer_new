import 'package:mockito/annotations.dart';
import 'package:notification_core/data/data_sources/notification_data_source.dart';
import 'package:notification_core/domain/repositories/notification_repository.dart';
import 'package:shared_libraries/http/http.dart' as http;

@GenerateMocks(
  [
    NotificationDataSource,
    NotificationRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
