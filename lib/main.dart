import 'package:aerospace/constants/app_route.dart';
import 'package:aerospace/firebase_options.dart';
import 'package:aerospace/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());

  _initServices();
}

void _initServices() {
  Get.putAsync<FirestoreService>(() async => FirestoreService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bhumeet User',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.SPLASH_SCREEN,
      getPages: AppRoute.pages,
    );
  }
}
