import 'package:cropify/routes/routes.dart';
import 'package:cropify/screens/common/theme.dart';
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
      theme: Themes.light,
      initialRoute: "/",
      getPages: GetPages.init(),
      defaultTransition: Transition.zoom,
    );
  }
}
