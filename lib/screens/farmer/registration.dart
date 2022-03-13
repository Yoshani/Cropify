import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class FarmerRegistration extends GetWidget<UserController> {
  FarmerRegistration({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumController = TextEditingController();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CropifyAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Complete Profile",
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 70, 2),
                  fontFamily: "AbhayaLibre",
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 6, 182, 85),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Personal Details",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre"),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: "Name"),
                          controller: nameController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Mobile Number"),
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "NIC Number"),
                          controller: nicController,
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 6, 182, 85),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Farm Details",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre"),
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Farm Name"),
                          controller: farmNameController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Address"),
                          controller: addressController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Registration Number"),
                          controller: regNumController,
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
              child: Card(
                shadowColor: const Color.fromARGB(255, 6, 182, 85),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Bank Details",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 70, 2),
                                fontFamily: "AbhayaLibre"),
                          ),
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Bank Name"),
                          controller: bankNameController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Account Number"),
                          controller: accountNumController,
                        ),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () {
                if (GetUtils.isPhoneNumber(phoneController.text)) {
                  controller.registerUser(
                    nameController.text,
                    phoneController.text,
                    nicController.text,
                    bankNameController.text,
                    accountNumController.text,
                    farmNameController.text,
                    addressController.text,
                    regNumController.text,
                  );
                } else {
                  Get.snackbar(
                      "Incorrect Format", "Please enter a valid phone number",
                      snackPosition: SnackPosition.BOTTOM,
                      snackStyle: SnackStyle.FLOATING);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
