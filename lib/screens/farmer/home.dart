import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_controller.dart';

class FarmerHome extends GetView<BottomNavController> {
  FarmerHome({Key? key}) : super(key: key);

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CropifyAppBar(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/vegies-home.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            height: 250,
            width: double.infinity,
          ),
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        minimumSize: const Size.fromHeight(60),
                        elevation: 5),
                    onPressed: () {},
                    child: const Text(
                      "REPORT INCIDENT",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Log',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                label: 'Complete',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.pink,
            onTap: controller.changePage,
          )),
    );
  }
}
