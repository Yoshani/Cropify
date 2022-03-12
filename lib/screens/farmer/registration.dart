import 'package:cropify/cropify_app.dart';
import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class FarmerRegistration extends GetWidget<AuthController> {
  const FarmerRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CropifyAppBar(),
    );
  }
}
