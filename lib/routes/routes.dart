import 'package:cropify/screens/farmer/home.dart';
import 'package:cropify/screens/common/splash_screen.dart';
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
          name: "/home", page: () => const Root(), transition: Transition.zoom),
      GetPage(
          name: "/rootHome",
          page: () => const RootHome(),
          transition: Transition.zoom),
      GetPage(
          name: "/farmerHome",
          page: () => const FarmerHome(),
          transition: Transition.zoom)
    ];
  }
}
