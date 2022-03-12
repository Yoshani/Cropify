// TODO: renew password, collect name and NIC
// Admin registers officer using email/pw and creates user record in firestore
// On login checks if name is null, redirects to initial registration page if true

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class OfficerRegistration extends GetWidget<AuthController> {
  const OfficerRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
