// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'package:audio/favirate.dart';
import 'package:audio/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  List<Tamer> favi = [];
//   saveFavirate(String id) {
//     final existing = favi.indexWhere((element) => element.id == id);
//     if (existing >= 0) {
//       favi.removeAt(existing);
//     } else {
//       favi.add(tamer.firstWhere((element) => element.id == id));
//     }
//   }

//   bool isFavirate(String id) {
//    return favi.any((element) => element.id == id);
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'StyleScript'))),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [Locale('ar')],
      debugShowCheckedModeBanner: false,
      home: Images(),
    );
  }
}
