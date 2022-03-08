import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs; // listen to changes to userModel

  UserModel get user => _userModel.value; // getter

  set user(UserModel value) => _userModel.value = value; // setter

  @override
  void onInit() {
    super.onInit();
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
