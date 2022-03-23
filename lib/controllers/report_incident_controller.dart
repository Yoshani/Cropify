import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/incident.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../models/media.dart';
import '../models/user.dart';
import '../services/database.dart';

class ReportIncidentController extends GetxController {
  final List<String> _cropTypeList = <String>[].obs;
  List<String> _selectedCropTypes = [];

  List<String>? get crops => _cropTypeList;

  set selectedCropTypes(List<String> value) => _selectedCropTypes = value;
  List<String> get selectedCrops => _selectedCropTypes;

  final isLoading = false.obs;

  @override
  onInit() {
    cropTypes();
    super.onInit();
  }

  void cropTypes() async {
    _cropTypeList.assignAll(await Database().getCropTypes());
  }

  void reportIncident(UserModel user, List<String> cropTypes, double acres,
      String description, List<Media> media) async {
    isLoading.value = true;
    UserAvatar _userAvatar = UserAvatar(
        userId: user.id,
        name: user.name,
        address: user.farm!.address,
        bankName: user.bank!.name,
        accountNum: user.bank!.accountNum);

    // upload media to firebase storage
    List<MediaDTO> mediaDTOs = [];
    try {
      for (Media mediaObj in media) {
        File file = File(mediaObj.file.path);
        final fileName = basename(file.path);
        final destination = 'incident-media/$fileName';

        final Reference storageReference =
            FirebaseStorage.instance.ref().child(destination);
        UploadTask uploadTask = storageReference.putFile(file);

        String url = await (await uploadTask).ref.getDownloadURL();

        mediaDTOs.add(MediaDTO(mediaRef: url, type: mediaObj.type));
      }
    } catch (e) {
      Get.snackbar(
        "Sorry",
        "Error uploading media",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    try {
      IncidentModel _incident = IncidentModel(
          types: cropTypes.join(', '),
          description: description.trim(),
          media: mediaDTOs,
          acres: acres,
          date: Timestamp.fromDate(DateTime.now()),
          status: "NEW",
          user: _userAvatar);

      if (await Database().createIncident(_incident)) {
        isLoading.value = false;
        Get.back();
        Get.snackbar("Success", "Your incident has been reported",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      }
    } catch (_) {
      isLoading.value = false;
      Get.snackbar("Sorry", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
