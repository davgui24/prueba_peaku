import 'package:flutter/material.dart';
import 'package:prueba_peaku/src/pages/login_page.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    'login': (BuildContext context) => LoginPage(),
    // 'register': (BuildContext context) => Register(),
  };
}