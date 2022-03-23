import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class InprogressTasks extends GetWidget<AuthController> {
  const InprogressTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("In-progress Tasks"),
    );
  }
}
