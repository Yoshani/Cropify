import 'package:get/get.dart';

import '../farmer_complete_incident.dart';

class FarmerCompleteIncidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FarmerCompleteIncidentController>(
        FarmerCompleteIncidentController());
  }
}
