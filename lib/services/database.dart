import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/farm.dart';
import 'package:flutter/foundation.dart';

import '../models/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "phone": user.phone,
        "nic": user.nic,
        "role": user.role,
        "profilePicRef": user.profilePicRef
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<UserModel> getUser(String? uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<bool> registerUser(
      UserModel user, FarmModel farm, BankModel bank) async {
    try {
      // update user
      await _firestore.collection("users").doc(user.id).update({
        "name": user.name,
        "phone": user.phone,
        "email": user.email,
        "nic": user.nic,
        "role": user.role,
        "profilePicRef": user.profilePicRef
      });
      // save farm
      await _firestore.collection("farms").doc().set({
        "userId": user.id,
        "name": farm.name,
        "address": farm.address,
        "regNum": farm.regNum
      });
      // save bank
      await _firestore.collection("banks").doc().set({
        "userId": user.id,
        "name": bank.name,
        "accountNum": bank.accountNum
      });
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
