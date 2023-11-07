import 'package:intl/intl.dart';

extension DateEx on DateTime {
  //Format date to day Month Year Hour:Minute AM/PM eg. 1 Jan 2021 12:00 PM

  String formatDateToDDMYTT({String? locale}) {
    return DateFormat('d MMM yyyy hh:mm aaa', locale).format(this);
  }
}

extension MoneyEx on num {
  String toMoneyFormat(String symbol, [int decimals = 0]) {
    return NumberFormat.currency(symbol: symbol, decimalDigits: decimals)
        .format(this);
  }
}
