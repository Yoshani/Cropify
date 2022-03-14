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

  void registerUser(String userName, String phone, String nic, String bankName,
      String accountNum, String farmName, String address, String regNum) async {
    try {
      user.name = userName.trim();
      user.nic = nic.trim();
      user.phone = phone;
      BankModel _bank = BankModel(
          userId: user.id,
          name: bankName.trim(),
          accountNum: accountNum.trim());
      FarmModel _farm = FarmModel(
          userId: user.id,
          name: farmName.trim(),
          address: address.trim(),
          regNum: regNum.trim());
      if (await Database().registerUser(user, _farm, _bank)) {
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
}
