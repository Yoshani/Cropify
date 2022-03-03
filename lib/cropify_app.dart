import 'package:cropify/routes/routes.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class CropifyApp extends StatelessWidget {
  const CropifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Cropify",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: GetPages.init(),
    );
  }
}
