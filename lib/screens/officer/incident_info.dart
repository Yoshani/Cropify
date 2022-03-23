import 'package:cropify/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class IncidentInfo extends GetWidget<AuthController> {
  const IncidentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const OfficerAppBar(),
      body: Text("Incident Info"),
    );
  }
}
