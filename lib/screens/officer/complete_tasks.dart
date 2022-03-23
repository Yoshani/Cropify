import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CompleteTasks extends GetWidget<AuthController> {
  const CompleteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Completed Tasks"),
    );
  }
}
