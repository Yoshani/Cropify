import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/farmer/account.dart';
import '../screens/farmer/complete_incident.dart';
import '../screens/farmer/home.dart';
import '../screens/farmer/incident_log.dart';

class BottomNavController extends GetxController {
  // static BottomNavController get to => Get.find();
  var currentIndex = 0.obs;

  final pages = <String>[
    'farmerHome',
    'farmerIncidentLog',
    'farmerCompleteIncident',
    'farmerAccount'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == 'farmerHome') {
      return GetPageRoute(
          settings: settings,
          page: () => const FarmerHome(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerIncidentLog') {
      return GetPageRoute(
          settings: settings,
          page: () => const IncidentLog(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerCompleteIncident') {
      return GetPageRoute(
          settings: settings,
          page: () => const CompleteIncident(),
          transition: Transition.noTransition);
    }

    if (settings.name == 'farmerAccount') {
      return GetPageRoute(
          settings: settings,
          page: () => const FarmerAccount(),
          transition: Transition.noTransition);
    }

    throw Exception();
  }
}
