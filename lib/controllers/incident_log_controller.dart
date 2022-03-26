import 'package:cropify/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../models/incident.dart';
import '../services/database.dart';

class IncidentLogController extends GetxController {
  final RxBool noNewIncidents = false.obs;
  final RxList<IncidentModel> _newIncidents = <IncidentModel>[].obs;

  List<IncidentModel> get newIncidents => _newIncidents;

  @override
  void onInit() {
    _newIncidents.bindStream(
        Database().userNewIncidents(Get.find<UserController>().user.id!));

    // noNewIncidents.value = _newIncidents.isEmpty ? true : false;
    super.onInit();
  }
}
