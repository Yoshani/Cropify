import 'package:cropify/models/incident_status.dart';
import 'package:cropify/screens/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/incident_controller.dart';

class InprogressTasks extends StatelessWidget {
  const InprogressTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IncidentController incidentController =
        Get.put<IncidentController>(IncidentController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "In-Progress Tasks",
                    style: CropifyThemes.titleTextTheme,
                  )),
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/officer-inprogress.png"),
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
              if (incidentController.incidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: incidentController.incidents.length,
                      itemBuilder: (BuildContext context, int index) {
                        if ((incidentController.incidents[index].status ==
                            IncidentStatus.IN_PROGRESS)) {
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 0, 10.0),
                            child: Card(
                              shadowColor:
                                  const Color.fromARGB(255, 6, 118, 182),
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
                                                .incidents[index].user!.name!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 12, 3, 71),
                                                fontFamily: "AbhayaLibre"),
                                          ),
                                          Text(
                                            incidentController
                                                .incidents[index].date!
                                                .toDate()
                                                .toString()
                                                .split(" ")
                                                .first,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 97, 97, 99),
                                                fontFamily: "AbhayaLibre"),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          incidentController
                                              .incidents[index].types!,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 97, 97, 99),
                                              fontFamily: "AbhayaLibre"),
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
                                                    .incidents[index]);
                                          },
                                          child: const Text(
                                            "Info",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "AbhayaLibre",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 0,
                            height: 0,
                          );
                        }
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
