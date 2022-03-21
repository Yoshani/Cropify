import 'package:cropify/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class OfficerHome extends GetWidget<AuthController> {
  const OfficerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OfficerAppBar(),
      body: Text("Officer Home"),
    );
  }
}
