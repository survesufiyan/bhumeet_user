import 'package:flutter/material.dart';
import 'package:bhumeet_user/screen/splash_screen.dart';
import 'package:bhumeet_user/screen/language_selection_screen.dart';
import 'package:bhumeet_user/screen/location_permission_screen.dart';
import 'package:bhumeet_user/screen/enter_mobile_screen.dart';
import 'package:bhumeet_user/screen/otp_verification_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhumeet User',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language_selection': (context) => LanguageSelectionScreen(),
        '/location_permission': (context) => LocationPermissionScreen(),
        '/enter_mobile': (context) => EnterMobileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/otp_verification') {
          final String phoneNumber = settings.arguments as String;
          return MaterialPageRoute(
            builder:
                (context) => OTPVerificationScreen(phoneNumber: phoneNumber),
          );
        }
        return null;
      },
    );
  }
}
