import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/crop_type.dart';
import 'package:cropify/models/farm.dart';
import 'package:cropify/models/incident2.dart';
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
        "role": user.role
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
        "role": user.role
      });
      // save farm
      await _firestore.collection("farms").doc().set({
        "userId": _firestore.collection("users").doc(user.id),
        "name": farm.name,
        "address": farm.address,
        "regNum": farm.regNum
      });
      // save bank
      await _firestore.collection("banks").doc().set({
        "userId": _firestore.collection("users").doc(user.id),
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

  Future<List<CropType>> getCropTypes() async {
    try {
      List<CropType> cropTypes = [];

      QuerySnapshot _query = await _firestore.collection("crops").get();
      for (var _doc in _query.docs) {
        cropTypes.add(CropType.fromDocumentSnapshot(documentSnapshot: _doc));
      }
      return cropTypes;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<bool> createIncident(IncidentModel incident) async {
    try {
      await _firestore.collection("incidents").add({
        "types": incident.types,
        "description": incident.description,
        "media": incident.media,
        "acres": incident.acres,
        "date": incident.date,
        "status": incident.status,
        "user": _firestore.collection("users").doc(incident.userId)
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
