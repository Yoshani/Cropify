import 'package:cropify/controllers/incident_controller.dart';
import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/screens/common/theme.dart';
import 'package:cropify/screens/common/video_settings.dart';
import 'package:cropify/screens/officer/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentInfo extends GetWidget<IncidentController> {
  IncidentInfo({Key? key}) : super(key: key);

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
                "Incident Info",
                style: CropifyThemes.titleTextTheme,
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
                          "Date :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                            incident.date!.toDate().toString().split(" ").first,
                            style: CropifyThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Location :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(incident.user!.address!,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Crop Types :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.types!,
                            style: CropifyThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Acres Affected :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(incident.acres.toString(),
                            style: CropifyThemes.mainTextTheme),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description :",
                          style: CropifyThemes.subTextTheme,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            incident.description!,
                            style: CropifyThemes.mainTextTheme,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _showStatus(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Photos & Videos",
                      style: CropifyThemes.subTextTheme,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildGridView(),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildProgressButton(incidentController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: incident.media!.length,
      itemBuilder: (context, index) {
        bool isVideo = incident.media![index].type == "Video";
        return GestureDetector(
          onTap: isVideo
              ? () => openVideoPlayer(incident.media![index].mediaRef!)
              : null,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                    isVideo
                        ? incident.media![index].thumbnail!
                        : incident.media![index].mediaRef!,
                    fit: BoxFit.cover),
              ),
              isVideo
                  ? const Icon(
                      Icons.play_circle_fill_rounded,
                      size: 32,
                      color: Colors.white70,
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget _showStatus() {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          children: const [
            Text(
              "Status :",
              style: CropifyThemes.subTextTheme,
            ),
            SizedBox(
              width: 20,
            ),
            Text("New", style: CropifyThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.IN_PROGRESS:
        return Row(
          children: const [
            Text(
              "Status :",
              style: CropifyThemes.subTextTheme,
            ),
            SizedBox(
              width: 20,
            ),
            Text("In-Progress", style: CropifyThemes.mainTextTheme),
          ],
        );
      case IncidentStatus.COMPLETED:
        return Column(children: [
          Row(
            children: const [
              Text(
                "Status :",
                style: CropifyThemes.subTextTheme,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Completed", style: CropifyThemes.mainTextTheme),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     const Text(
          //       "Amount :",
          //       style: CropifyThemes.subTextTheme,
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Text(incident.amount.toString(),
          //         style: CropifyThemes.mainTextTheme),
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Row(
          //   children: [
          //     const Text(
          //       "Comment :",
          //       style: CropifyThemes.subTextTheme,
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     Text(incident.comment!, style: CropifyThemes.mainTextTheme),
          //   ],
          // )
        ]);

      default:
        return Container();
    }
  }

  Widget _buildProgressButton(IncidentController incidentController) {
    switch (incident.status) {
      case IncidentStatus.NEW:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropifyThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                incidentController.setStatus(
                    incident.id!, IncidentStatus.IN_PROGRESS, '', 0.0);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "In-Progress",
                style: CropifyThemes.buttonTextTheme,
              ),
            ),
          ],
        );

      case IncidentStatus.IN_PROGRESS:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                openAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                "Reject",
                style: CropifyThemes.buttonTextTheme,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openPaymentAlertBox(incidentController);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                "Make Payment",
                style: CropifyThemes.buttonTextTheme,
              ),
            )
          ],
        );

      default:
        return Container();
    }
  }

  openVideoPlayer(String URL) {
    Get.defaultDialog(
        title: "Preview",
        radius: 4,
        content: SizedBox(
          height: 400,
          child: VideoDisplay(
            URLPath: URL,
          ),
        ));
  }

  openAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Confirm Rejection",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "AbhayaLibre"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Leave a comment...",
                hintStyle: TextStyle(fontSize: 15),
              ),
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
                    incidentController.setStatus(incident.id!,
                        IncidentStatus.REJECTED, commentController.text, 0.0);
                    Get.offAllNamed("/OfficerHomeRoot");
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
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

  openPaymentAlertBox(IncidentController incidentController) {
    Get.defaultDialog(
        title: "",
        radius: 10,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Make Payment",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 56),
                  fontFamily: "AbhayaLibre"),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: amoountContorller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Amount (Rs.)",
                hintStyle: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: commentController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Leave a comment...",
                hintStyle: TextStyle(fontSize: 15),
              ),
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
                    Map paymentObject = {
                      "sandbox": true, // true if using Sandbox Merchant ID
                      "merchant_id": "1211149", // Replace your Merchant ID
                      "notify_url": "https://ent13zfovoz7d.x.pipedream.net/",
                      "amount": double.parse(amoountContorller.text),
                      "currency": "LKR",
                      "comment": commentController.text
                    };
                    incidentController.startPaymentOption(
                        incident.id!,
                        IncidentStatus.COMPLETED,
                        commentController.text,
                        double.parse(amoountContorller.text),
                        paymentObject);
                    // incidentController.setStatus(
                    //     incident.id!,
                    //     IncidentStatus.COMPLETED,
                    //     commentController.text,
                    //     double.parse(amoountContorller.text));

                    Get.offAllNamed("/OfficerHomeRoot");
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Text(
                    "Confirm",
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
