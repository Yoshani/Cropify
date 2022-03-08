import 'package:cropify/screens/farmer/farmer_home.dart';
import 'package:cropify/screens/splash.dart';
import 'package:get/get.dart';

import '../controllers/bindings/splash_binding.dart';
import '../screens/root.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(name: "/", page: () => const SplashScreen(), binding: SplashBinding()),
      GetPage(
          name: "/home", page: () => const Root(), transition: Transition.zoom),
      GetPage(
          name: "/farmerHome",
          page: () => const FarmerHome(),
          transition: Transition.zoom)
    ];
  }
}
