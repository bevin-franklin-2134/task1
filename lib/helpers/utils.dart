import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';

import 'nav_observer.dart';

translate(String text) {
  return NavObserver.navKey.currentContext?.tr(text);
}

void hideKeyboard(BuildContext buildContext) {
  FocusScopeNode currentFocus = FocusScope.of(buildContext);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
String formatUSCurrency(double amount) {
  // Create a NumberFormat instance for the US locale
  var formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

  // Format the amount using the US currency format
  return formatter.format(amount);
}
Color getColorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
ResultBloc? getResultBloc() {
  if (NavObserver.navKey.currentContext != null) {
    return NavObserver.navKey.currentContext!.read<ResultBloc>();
  }
  return null;
}