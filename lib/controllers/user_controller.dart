import 'package:firebase_auth/firebase_auth.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/farm.dart';
import 'package:get/get.dart';

import '../models/user.dart';
import '../services/database.dart';

class UserController extends GetxController {
  final Rx<UserModel> _userModel =
      UserModel().obs; // listen to changes to userModel

  UserModel get user => _userModel.value; // getter

  set user(UserModel value) => _userModel.value = value; // setter

  void clear() {
    _userModel.value = UserModel();
  }

  void registerUser(String userId, String userName, String nic, String bankName,
      String accountNum, String farmName, String address, String regNum) async {
    try {
      UserModel _user = UserModel(name: userName.trim(), nic: nic.trim());
      BankModel _bank = BankModel(
          userId: userId, name: bankName.trim(), accountNum: accountNum.trim());
      FarmModel _farm = FarmModel(
          userId: userId,
          name: farmName.trim(),
          address: address.trim(),
          regNum: regNum.trim());
      if (await Database().registerUser(_user, _farm, _bank)) {
        Get.find<UserController>().user.name = _user.name;
        Get.find<UserController>().user.nic = _user.nic;
        Get.toNamed("/farmerHome");
      }
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
