import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// `DateTime` の値を任意のフォーマットで整形した文字列を返す.
  String formattedString(String format) {
    final dateFormate = DateFormat(format);
    return dateFormate.format(this);
  }
}
