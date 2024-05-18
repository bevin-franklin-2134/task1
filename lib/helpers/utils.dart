import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';

import 'nav_observer.dart';

/// Function to translate a given [value] using the current context's localization settings
translate(String value) {
  return NavObserver.navKey.currentContext?.tr(value);
}

/// Function to hide the keyboard for a given [context]
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

/// Function to format a double [amount] as US currency
String formatUSCurrency(double amount) {
  // Create a NumberFormat instance for the US locale
  var formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

  // Format the amount using the US currency format
  return formatter.format(amount);
}

/// Function to convert a hex color string [hexColor] to a Color object
Color getColorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

/// Function [getResultBloc] to retrieve the ResultBloc instance from the current context
ResultBloc? getResultBloc() {
  if (NavObserver.navKey.currentContext != null) {
    return NavObserver.navKey.currentContext!.read<ResultBloc>();
  }
  return null;
}

/// Function [getPrettyJSONString] to convert a JSON object to a pretty-printed JSON string
String getPrettyJSONString(jsonObject) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}