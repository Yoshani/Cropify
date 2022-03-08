import 'package:cropify/routes/routes.dart';
import 'package:cropify/screens/auth/login.dart';
import 'package:cropify/screens/farmer/farmer_home.dart';
import 'package:cropify/screens/welcome_screen.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'controllers/bindings/auth_binding.dart';

class CropifyApp extends StatelessWidget {
  const CropifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Cropify",
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: "/",
      getPages: GetPages.init(),
      // home: const WelcomeScreen(),
      theme: ThemeData.dark(),
    );
  }
}
