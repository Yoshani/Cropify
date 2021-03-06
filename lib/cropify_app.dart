import 'package:cropify/routes/routes.dart';
import 'package:cropify/screens/common/theme.dart';
import 'package:cropify/services/push_notification_service.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'controllers/bindings/auth_binding.dart';

class CropifyApp extends StatelessWidget {
  // const CropifyApp({Key? key}) : super(key: key) ;
  CropifyApp() {
    PushNotificationService().initialise();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Cropify",
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      theme: CropifyThemes.light,
      initialRoute: "/",
      getPages: GetPages.init(),
      defaultTransition: Transition.zoom,
    );
  }
}
