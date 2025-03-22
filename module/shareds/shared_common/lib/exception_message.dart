//
// ignore_for_file: constant_identifier_names, comment_references

///
/// [Frequently] Used Messages for [ServerException]
///
const String UNAUTHENTICTED = 'unauthenticated';
const String INTERNAL_SERVER_ERROR = 'internal_server_error';
const String INTERNET_NOT_CONNECTED = 'internet_not_connected';
const String INVALID_KEY = 'invalid_key';
const String UPDATE_REQUIRED = 'update_required';

///
/// This argument used for [Snackbar] or [Toast]
///

class AuthenticationException {
  static String otpCooldown = 'otpCooldown';
  static String otpInvalid = 'otpInvalid';
}

class DepositException {
  static String notFound = 'notFound';
}

class NotificationException {
  static String invalidTypeData = 'invalidTypeData';
}

class TransactionException {
  static String notFound = 'notFound';
  static String outOfStock = 'outOfStock';
  static String outsideOperationHour = 'outsideOperationHour';
}

class UserException {
  static String numberAlreadyRegister = 'numberAlreadyRegister';
}

class ResellerException {
  static String underReview = 'underReview';
}
