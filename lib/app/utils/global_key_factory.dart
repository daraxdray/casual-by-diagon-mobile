import 'package:flutter/widgets.dart';

class GlobalKeyFactory {
  static GlobalKey<FormState> generateUniqueFormKey() {
    return GlobalKey<FormState>();
  }

  static GlobalKey<FormFieldState<dynamic>> generateUniqueFormFieldKey() {
    return GlobalKey<FormFieldState<dynamic>>();
  }
  static GlobalKey generateUniqueKey() {
    return GlobalKey();
  }
}