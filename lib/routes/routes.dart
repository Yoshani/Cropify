import 'package:cropify/controllers/bindings/bottom_nav_binding.dart';
import 'package:cropify/screens/farmer/account.dart';
import 'package:cropify/screens/farmer/complete_incident.dart';
import 'package:cropify/screens/farmer/home.dart';
import 'package:cropify/screens/common/splash_screen.dart';
import 'package:cropify/screens/farmer/incident_log.dart';
import 'package:cropify/screens/farmer/report_incident.dart';
import 'package:get/get.dart';

import '../controllers/bindings/splash_binding.dart';
import '../screens/common/root.dart';
import '../screens/common/root_home.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(
          name: "/",
          page: () => const SplashScreen(),
          binding: SplashBinding()),
      GetPage(
          name: "/root", page: () => const Root(), transition: Transition.zoom),
      GetPage(
          name: "/rootHome",
          page: () => const RootHome(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerHome",
          page: () => FarmerHome(),
          binding: BottomNavBinding(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerReportIncident",
          page: () => const ReportIncident(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerIncidentLog",
          page: () => const IncidentLog(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerCompleteIncident",
          page: () => const CompleteIncident(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerAccount",
          page: () => const FarmerAccount(),
          transition: Transition.zoom),
    ];
  }
}
