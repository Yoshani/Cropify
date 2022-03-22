import 'package:cropify/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CompleteTasks extends GetWidget<AuthController> {
  const CompleteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OfficerAppBar(),
      body: Text("Completed Tasks"),
    );
  }
}
