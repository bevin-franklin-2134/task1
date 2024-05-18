import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:task1/UI/dashboard.dart';
import 'package:task1/ui/result_json_screen.dart';
import 'package:task1/ui/task_selection_screen.dart';

import 'nav_observer.dart';

const String route = "/";
const String task_1 = "/task_1";
const String task_2 = "/task_2";

Route<Object?>? generateRoute(RouteSettings settings) {
  return getRoute(settings.name);
}

Route<Object?>? getRoute(String? name,
    {LinkedHashMap? args, Function(dynamic)? result}) {
  switch (name) {
    case route:
      return MaterialPageRoute(
          builder: (context) => const TaskSelectionScreen(),
          settings: RouteSettings(name: name));
    case task_1:
      return MaterialPageRoute(
          builder: (context) => const Dashboard(),
          settings: RouteSettings(name: name));
    case task_2:
      return MaterialPageRoute(
          builder: (context) => const ResultJsonScreen(),
          settings: RouteSettings(name: name));


  }
  return null;
}

openScreen(String routeName,
    {bool forceNew = false,
    bool requiresAsInitial = false,
    LinkedHashMap? args,
    Function(dynamic)? result}) {
  var route = getRoute(routeName, args: args, result: result);
  var context = NavObserver.navKey.currentContext;

  if (route != null && context != null) {
    if (requiresAsInitial) {
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else if (forceNew || !NavObserver.instance.containsRoute(route)) {
      Navigator.push(context, route);
    } else {
      Navigator.popUntil(context, (route) {
        if (route.settings.name == routeName) {
          if (args != null) {
            (route.settings.arguments as Map)["result"] = args;
          }
          return true;
        }
        return false;
      });
    }
  }
}

back(LinkedHashMap? args) {
  if (NavObserver.navKey.currentContext != null) {
    Navigator.pop(NavObserver.navKey.currentContext!, args);
  }
}

replaceCurrentScreen(String name, {LinkedHashMap? args}) {
  var route = getRoute(name, args: args);
  var context = NavObserver.navKey.currentContext;
  if (route != null && context != null) {
    Navigator.pushReplacement(context, route);
  }
}
