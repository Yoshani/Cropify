import 'dart:io';

import 'package:cropify/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/farm.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../models/user.dart';
import '../services/database.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel =
      UserModel().obs; // listen to changes to userModel

  UserModel get user => _userModel.value; // getter

  set user(UserModel value) => _userModel.value = value; // setter

  var isProfilePathSet = false.obs;
  var profilePath = ''.obs;

  void setProfileImagePath(String path) {
    profilePath.value = path;
    isProfilePathSet.value = true;
  }

  void clear() {
    _userModel.value = UserModel();
  }

  void registerUser(String userName, String phone, String nic, String bankName,
      String accountNum, String farmName, String address, String regNum) async {
    try {
      BankModel _bank =
          BankModel(name: bankName.trim(), accountNum: accountNum.trim());
      FarmModel _farm = FarmModel(
          name: farmName.trim(),
          address: address.trim(),
          regNum: regNum.trim());
      user.name = userName.trim();
      user.nic = nic.trim();
      user.phone = phone;
      user.bank = _bank;
      user.farm = _farm;

      if (await Database().registerUser(user)) {
        Get.offAllNamed("/farmerHomeRoot");
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateOfficer(String userName, String phone, String nic) async {
    try {
      //upload profile picture to firebase storage
      String? url;
      if (isProfilePathSet.value == true) {
        String filename = basename(profilePath.value);
        File imageFile = File(profilePath.value);

        final Reference storageReference =
            FirebaseStorage.instance.ref().child("profiles/$filename");
        UploadTask uploadTask = storageReference.putFile(imageFile);

        url = await (await uploadTask).ref.getDownloadURL();
      } else {
        url = null;
      }

      user.name = userName.trim();
      user.phone = phone;
      user.nic = nic.trim();
      user.profilePicRef = url;

      if (await Database().updateOfficer(user)) {
        Get.offAllNamed("/OfficerHomeRoot");
      }
    } catch (e) {
      Snackbar.showError("Error updating profile");
    }
  }
}
