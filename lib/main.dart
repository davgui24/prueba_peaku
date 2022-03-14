import 'package:flutter/material.dart';
import 'package:prueba_peaku/src/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba PeakU',
      initialRoute: 'login',
       routes: routes()
    );
  }
}

