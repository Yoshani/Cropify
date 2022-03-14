import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>[
    '/farmerHome',
    '/farmerIncidentLog',
    '/farmerCompleteIncident',
    '/farmerAccount'
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index]);
  }
}
