import 'package:cropify/controllers/incident_log_controller.dart';
import 'package:get/get.dart';

class IncidentLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IncidentLogController>(IncidentLogController());
  }
}
