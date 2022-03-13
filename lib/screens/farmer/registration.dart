import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class FarmerRegistration extends GetWidget<UserController> {
  FarmerRegistration({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumController = TextEditingController();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CropifyAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 25,
            ),
            Text(
              "Complete Profile",
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 70, 2),
                  fontFamily: "AbhayaLibre",
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
