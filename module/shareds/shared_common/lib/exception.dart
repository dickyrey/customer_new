// ignore_for_file: constant_identifier_names,, comment_references

class ServerException implements Exception {
  ServerException(this.message);
  final String message;
}

class DatabaseException implements Exception {
  DatabaseException(this.message);
  final String message;
}

class CacheException implements Exception {
  CacheException(this.message);
  final String message;
}
