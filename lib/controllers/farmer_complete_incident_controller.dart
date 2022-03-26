import 'package:get/get.dart';

import '../models/incident.dart';
import '../services/database.dart';
import 'user_controller.dart';

class FarmerCompleteIncidentController extends GetxController {
  final RxList<IncidentModel> _completeIncidents = <IncidentModel>[].obs;

  List<IncidentModel> get completeIncidents => _completeIncidents;

  @override
  void onInit() async {
    _completeIncidents.bindStream(
        Database().userCompleteIncidents(Get.find<UserController>().user.id!));

    super.onInit();
  }
}
