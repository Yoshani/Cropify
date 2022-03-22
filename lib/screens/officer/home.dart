import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

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
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
            child: Card(
              shadowColor: const Color.fromARGB(255, 6, 118, 182),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "2022/01/12",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 78, 78, 80),
                              fontFamily: "AbhayaLibre"),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sachini Dissanayaka",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 1, 0, 8),
                              fontFamily: "AbhayaLibre"),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Sugar Cane, Carrot",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 78, 78, 80),
                              fontFamily: "AbhayaLibre"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 2, 3, 70)),
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
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
