import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/farm.dart';
import 'package:cropify/models/incident.dart';
import 'package:cropify/models/incident_status.dart';
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

  Future<List<IncidentModel>> getIncidents() async {
    try {
      QuerySnapshot _doc = await _firestore.collection("incidents").get();

      return _doc.docs
          .map((doc) => IncidentModel.fromDocumentSnapshot(
              id: doc.id, documentSnapshot: doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<void> setIncidentStatus(String id, IncidentStatus status) async {
    try {
      await _firestore
          .collection("incidents")
          .doc(id)
          .update({"status": status.name});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  // Stream<List<IncidentModel>> incidentStream() {
  //   Stream<List<IncidentModel>> stream = _firestore
  //       .collection("incidents")
  //       .orderBy("date", descending: true)
  //       .snapshots()
  //       .map((QuerySnapshot querySnapshot) => querySnapshot.docs
  //           .map((doc) => IncidentModel.fromDocumentSnapshot(
  //               documentSnapshot: doc.data() as Map<String, dynamic>))
  //           .toList());
  //   return stream;
  // }

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
