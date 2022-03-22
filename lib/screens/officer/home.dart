import 'package:cropify/controllers/incident_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficerHome extends StatelessWidget {
  const OfficerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/officer-home.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          GetX<IncidentController>(
            init: Get.put<IncidentController>(IncidentController()),
            builder: (IncidentController incidentController) {
              if (!incidentController.incidents.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: incidentController.incidents.length,
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
                                        const Text(
                                          "Sachini Dissanayaka",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(255, 1, 0, 8),
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
                                                  255, 78, 78, 80),
                                              fontFamily: "AbhayaLibre"),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        incidentController
                                            .incidents[index].description!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 78, 78, 80),
                                            fontFamily: "AbhayaLibre"),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color.fromARGB(
                                                255, 2, 3, 70)),
                                        onPressed: () {
                                          Get.toNamed("/IncidentInfo");
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
