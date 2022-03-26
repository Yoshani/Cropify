import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/widgets/snackbar.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class IncidentController extends GetxController {
  final RxList<IncidentModel> _incidentList = <IncidentModel>[].obs;

  List<IncidentModel> get incidents => _incidentList;

  @override
  void onInit() async {
    _incidentList.bindStream(Database().incidentStream());
    super.onInit();
  }

  void setStatus(String id, IncidentStatus value, String comment) async {
    try {
      await Database().setIncidentStatus(id, value, comment);
      Snackbar.showSuccess("Moved to ${value.name}");
    } catch (e) {
      Snackbar.showError(e.toString());
    }
  }
}
