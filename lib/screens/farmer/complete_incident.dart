import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CompleteIncident extends GetView<AuthController> {
  const CompleteIncident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Completed Incidents",
                    style: TextStyle(
                        fontFamily: "AbhayaLibre",
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/vegies-other.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            width: double.infinity,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Column(children: <Widget>[]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
