import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}


extension IntExtension on int {
  String formatDgNum(){
    var f = NumberFormat.decimalPattern("en_US");
    return f.format(this);
  }
}