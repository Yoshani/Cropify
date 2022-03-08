import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import 'auth/login.dart';
import 'farmer/farmer_home.dart';

class WelcomeScreen extends GetWidget<AuthController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return FarmerHome();
        } else {
          return Login();
        }
      },
    );
  }
}
