import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_controller.dart';
import '../../models/incident_status.dart';
import '../common/theme.dart';

class CompleteTasks extends StatelessWidget {
  CompleteTasks({Key? key}) : super(key: key);

  IncidentController incidentController =
      Get.put<IncidentController>(IncidentController());

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/officer-complete.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () {
              if (incidentController.completeIncidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: incidentController.completeIncidents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 0.0, 0, 10.0),
                          child: Card(
                            shadowColor: const Color.fromARGB(255, 6, 118, 182),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          incidentController
                                              .completeIncidents[index]
                                              .user!
                                              .name!,
                                          style: CropifyThemes.mainTextTheme,
                                        ),
                                        Text(
                                          incidentController
                                              .completeIncidents[index].date!
                                              .toDate()
                                              .toString()
                                              .split(" ")
                                              .first,
                                          style: CropifyThemes.subTextTheme,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          incidentController
                                              .completeIncidents[index].types!,
                                          style: CropifyThemes.subTextTheme,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 20, 9, 119)),
                                        onPressed: () {
                                          Get.toNamed("/IncidentInfo",
                                              arguments: incidentController
                                                  .completeIncidents[index]);
                                        },
                                        child: const Text(
                                          "Info",
                                          style: CropifyThemes.buttonTextTheme,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Center(child: Image.asset("assets/no-records-gif.gif"));
              }
            },
          ),
        ],
      ),
    );
  }
}
