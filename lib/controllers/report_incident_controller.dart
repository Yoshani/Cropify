import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/crop_type.dart';
import 'package:cropify/models/incident2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/media.dart';
import '../services/database.dart';

class ReportIncidentController extends GetxController {
  final List<CropType> _cropTypeList = <CropType>[].obs;

  List<CropType>? get crops => _cropTypeList;

  @override
  onInit() {
    cropTypes();
    super.onInit();
  }

  void cropTypes() async {
    _cropTypeList.assignAll(await Database().getCropTypes());
  }

  void reportIncident(List<String> cropTypes, double acres, String description,
      List<Media> media) async {
    try {
      IncidentModel _incident = IncidentModel(
          types: cropTypes,
          description: description.trim(),
          media: media,
          acres: acres,
          date: Timestamp.fromDate(DateTime.now()),
          status: "NEW");

      if (await Database().createIncident(_incident)) {
        Get.offNamed("/farmerReportIncident");
        Get.snackbar("Success", "Your incident has been reported",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      }
    } catch (_) {
      Get.snackbar("Sorry", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
