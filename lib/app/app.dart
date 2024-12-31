import 'package:flutter/material.dart';
import 'package:noname_app/views/homeview.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FLUTTER',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const Homeview());
  }
}
