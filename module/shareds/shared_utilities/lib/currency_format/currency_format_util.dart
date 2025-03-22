import 'package:shared_libraries/intl/intl.dart';

String currencyFormat(
  int amount, {
  String symbol = 'Rp',
}) {
  final formatter = NumberFormat.currency(
    locale: 'id-ID',
    symbol: symbol,
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
