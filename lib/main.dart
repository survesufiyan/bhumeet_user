<<<<<<< HEAD
import 'package:aerospace/constants/app_route.dart';
import 'package:aerospace/firebase_options.dart';
import 'package:aerospace/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
=======
import 'package:bhumeet_user/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhumeet_user/screen/splash_screen.dart';
import 'package:bhumeet_user/screen/language_selection_screen.dart';
import 'package:bhumeet_user/screen/location_permission_screen.dart';
import 'package:bhumeet_user/screen/enter_mobile_screen.dart';
import 'package:bhumeet_user/screen/otp_verification_screen.dart';
import 'package:bhumeet_user/repository/authentication_repository.dart'; // Ensure this import is correct
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
<<<<<<< HEAD
=======
  Get.put(AuthenticationRepository()); // Inject Authentication Repository
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
  runApp(MyApp());

  _initServices();
}

void _initServices() {
  Get.putAsync<FirestoreService>(() async => FirestoreService());
}

class AuthenticationRepository {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bhumeet User',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: AppRoute.SPLASH_SCREEN,
      getPages: AppRoute.pages,
=======
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(
          name: '/language_selection',
          page: () => LanguageSelectionScreen(),
        ),
        GetPage(
          name: '/location_permission',
          page: () => LocationPermissionScreen(),
        ),
        GetPage(name: '/enter_mobile', page: () => EnterMobileScreen()),
      ],
      onGenerateRoute: (settings) {
        if (settings.name == '/otp_verification') {
          final Map<String, String> args =
              settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder:
                (context) => OTPVerificationScreen(
                  phoneNumber: args['phoneNumber']!,
                  verificationId: args['verificationId']!,
                ),
          );
        }
        return null;
      },
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
    );
  }
}
