import 'package:cropify/controllers/incident_controller.dart';
import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/screens/common/theme.dart';
import 'package:cropify/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficerPayment extends GetWidget<IncidentController> {
  OfficerPayment({Key? key}) : super(key: key);

  IncidentModel incident = Get.arguments;

  final TextEditingController commentController = TextEditingController();
  final TextEditingController amoountContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    IncidentController incidentController =
        Get.put<IncidentController>(IncidentController());
    return Scaffold(
      appBar: const OfficerAppBar(),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Payment",
                style: CropifyThemes.titleTextTheme,
              ),
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/payment.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Name :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(incident.user!.name!,
                            style: CropifyThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Bank :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(incident.user!.bankName!,
                            style: CropifyThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Account No :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(incident.user!.accountNum!,
                            style: CropifyThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // incidentController.setStatus(
                          //     incident.id!, IncidentStatus.COMPLETED, '');
                        },
                        child: const Text(
                          "Confirm",
                          style: CropifyThemes.buttonTextTheme,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openPaymentAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Confirm Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "AbhayaLibre"),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // incidentController.setStatus(incident.id!,
                    //     IncidentStatus.REJECTED, commentController.text);
                    Get.offAllNamed("/OfficerHomeRoot");
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Pay",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "AbhayaLibre",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
