import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

import '../services/database.dart';

class IncidentController extends GetxController {
  final RxList<IncidentModel> _incidentList = <IncidentModel>[].obs;

  List<IncidentModel> get incidents => _incidentList;

  @override
  void onInit() async {
    _incidentList.bindStream(Database().incidentStream());
    super.onInit();
  }

  void setStatus(
      String id, IncidentStatus value, String comment, num amount) async {
    try {
      await Database().setIncidentStatus(id, value, comment, amount);
      Snackbar.showSuccess("Moved to ${value.name}");
    } catch (e) {
      Snackbar.showError(e.toString());
    }
  }

  void startPaymentOption(String id, IncidentStatus value, String comment,
      num amount, Map paymentObject) {
    PayHere.startPayment(paymentObject, (paymentId) {
      setStatus(id, value, comment, amount);
      print("One Time Payment Success. Payment Id: $paymentId");
    }, (error) {
      Snackbar.showError(error);
      print("One Time Payment Failed. Error: $error");
    }, () {
      Snackbar.showError("One Time Payment Dismissed");
      print("One Time Payment Dismissed");
    });
  }
}
