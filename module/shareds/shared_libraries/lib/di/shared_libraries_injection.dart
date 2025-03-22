import 'package:shared_libraries/get_it/get_it.dart';
import 'package:shared_libraries/http/http.dart' as http;

class SharedLibrariesInjection {
  SharedLibrariesInjection() {
    // sharedPreferences();
    httpClient();
  }

  // Future<void> sharedPreferences() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   locator.registerLazySingleton<SharedPreferences>(
  //     () => sharedPreferences,
  //   );
  // }

  Future<void> httpClient() async {
    final httpClient = http.Client();
    locator.registerLazySingleton(() => httpClient);
  }
}
