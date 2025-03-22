// ignore_for_file: constant_identifier_names

enum RequestState { empty, loading, error, loaded, initializing, initialized }

enum SnackbarType { error, success, info }

enum ExceptionType {
  other,
  internal_server_error,
  internet_not_connected,
  invalid_key,
  update_required,
}
