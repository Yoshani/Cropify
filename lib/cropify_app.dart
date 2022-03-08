import 'package:cropify/routes/routes.dart';
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
      theme: ThemeData.light(),
    );
  }
}
