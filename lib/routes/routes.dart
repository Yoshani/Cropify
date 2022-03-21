import 'package:cropify/controllers/bindings/camera_binding.dart';
import 'package:cropify/controllers/bindings/report_incident_binding.dart';
import 'package:cropify/screens/common/splash_screen.dart';
import 'package:cropify/screens/farmer/home_root.dart';
import 'package:cropify/screens/farmer/report_incident.dart';
import 'package:get/get.dart';

import '../controllers/bindings/splash_binding.dart';
import '../screens/common/root.dart';
import '../screens/common/root_home.dart';
import '../screens/farmer/camera_screen.dart';

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
          name: "/farmerHomeRoot",
          page: () => FarmerHomeRoot(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerReportIncident",
          page: () => ReportIncident(),
          binding: ReportIncidentBinding(),
          transition: Transition.zoom),
      GetPage(
          name: "/camera",
          page: () => Camera(),
          binding: CameraBinding(),
          transition: Transition.zoom),
    ];
  }
}
