import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class ReportIncident extends GetWidget<AuthController> {
  const ReportIncident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CropifyAppBar(),
    );
  }
}