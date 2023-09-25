// routes.dart
import 'package:flutter/material.dart';
// ignore: unused_import
import 'pages/home_page.dart';
import 'pages/login_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}

// ignore: non_constant_identifier_names
NotFoundPage() {
}

// ignore: non_constant_identifier_names
HomePage() {
}
