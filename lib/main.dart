import 'package:flutter/material.dart';
import 'package:bhumeet_user/screen/splash_screen.dart';
import 'package:bhumeet_user/screen/language_selection_screen.dart';
import 'package:bhumeet_user/screen/location_permission_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhumeet User',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language_selection': (context) => LanguageSelectionScreen(),
        '/location_permission': (context) => LocationPermissionScreen(),
      },
    );
  }
}
