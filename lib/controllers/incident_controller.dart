import 'package:cropify/models/incident.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class IncidentController extends GetxController {
  RxList<IncidentModel> incidentList = <IncidentModel>[].obs;

  List<IncidentModel> get incidents => incidentList.value;

  @override
  void onInit() async {
    List<IncidentModel> _list = await Database().getIncidents();
    incidentList.assignAll(_list);
  }
}
