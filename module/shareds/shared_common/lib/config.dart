class AppConfig {
  factory AppConfig() => _instance;

  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();

  bool isDev = false;
}
