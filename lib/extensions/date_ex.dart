import 'package:intl/intl.dart';

/// An extension on the [DateTime] class to provide additional date formatting functionality.
///
/// This extension adds the `formatDateToDDMYTT` method, which formats the date to the format
/// "day Month Year Hour:Minute AM/PM". The method takes an optional [locale] parameter
/// to specify the locale for the formatted date.
///
/// Example usage:
/// ```dart
/// DateTime now = DateTime.now();
/// String formattedDate = now.formatDateToDDMYTT();
/// print(formattedDate); // e.g. "1 Jan 2021 12:00 PM"
///

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
