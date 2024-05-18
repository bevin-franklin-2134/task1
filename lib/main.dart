import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/data_bloc/result_bloc.dart';
import 'package:task1/helpers/nav_helper.dart';
import 'package:task1/helpers/nav_observer.dart';
import 'package:task1/helpers/utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: 'language',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => ResultBloc()),
      ],
      child: MaterialApp(
        title: 'Task1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorObservers: [NavObserver.instance],
        navigatorKey: NavObserver.navKey,
        initialRoute: route,
        onGenerateRoute: generateRoute,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (Platform.isIOS) {
                hideKeyboard(context);
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
