import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/widgets/snackbar.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class IncidentController extends GetxController {
  RxList<IncidentModel> incidentList = <IncidentModel>[].obs;

  List<IncidentModel> get incidents => incidentList.value;

  @override
  void onInit() async {
    incidentList.bindStream(Database().incidentStream());
  }

  void setStatus(String id, IncidentStatus value) async {
    try {
      await Database().setIncidentStatus(id, value);
      Snackbar.showSuccess("Moved to ${value.name}");
    } catch (e) {
      Snackbar.showError(e.toString());
    }
  }
}
