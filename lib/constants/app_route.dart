// ignore_for_file: constant_identifier_names

import 'package:aerospace/screen/enter_mobile_screen.dart';
import 'package:aerospace/screen/home_screen.dart';
import 'package:aerospace/screen/language_selection_screen.dart';
import 'package:aerospace/screen/location_permission_screen.dart';
import 'package:aerospace/screen/otp_verification_screen.dart';
import 'package:aerospace/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String SPLASH_SCREEN = '/';
  static const String LANGUAGE_SELECTION_SCREEN = '/language_selection';
  static const String LOCATION_PERMISSION_SCREEN = '/location_permission';
  static const String ENTER_MOBILE_SCREEN = '/enter_mobile';
  static const String OTP_VERIFICATION_SCREEN = '/otp_verification';
  static const String HOME_SCREEN = '/home';

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: LANGUAGE_SELECTION_SCREEN,
      page: () => LanguageSelectionScreen(),
    ),
    GetPage(
      name: LOCATION_PERMISSION_SCREEN,
      page: () => LocationPermissionScreen(),
    ),
    GetPage(
      name: ENTER_MOBILE_SCREEN,
      page: () => EnterMobileScreen(),
    ),
    GetPage(
      name: OTP_VERIFICATION_SCREEN,
      page: () => OTPVerificationScreen(),
    ),
    GetPage(
      name: HOME_SCREEN,
      page: () => HomeScreen(),
    ),
  ];
}
