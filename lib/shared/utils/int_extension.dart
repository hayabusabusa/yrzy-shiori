import 'package:intl/intl.dart';

extension IntExtension on int {
  String formattedString(String format) {
    final formatter = NumberFormat(format);
    return formatter.format(this);
  }
}