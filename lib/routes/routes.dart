import 'package:cropify/screens/farmer/farmer_home.dart';
import 'package:get/get.dart';

import '../screens/welcome_screen.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(
          name: "/",
          page: () => const WelcomeScreen(),
          transition: Transition.zoom),
      GetPage(name: "/farmerHome", page: () => FarmerHome())
    ];
  }
}
