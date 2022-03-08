import 'package:cropify/screens/farmer/farmer_home.dart';
import 'package:get/get.dart';

import '../screens/root.dart';

class GetPages {
  static List<GetPage> init() {
    return <GetPage>[
      GetPage(name: "/", page: () => const Root()),
      GetPage(
          name: "/farmerHome",
          page: () => FarmerHome(),
          transition: Transition.zoom)
    ];
  }
}
