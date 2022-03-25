import 'package:cloud_firestore/cloud_firestore.dart';
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
        "profilePicRef": user.profilePicRef,
        "bank": user.bank,
        "farm": user.farm
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

  Stream<List<IncidentModel>> incidentStream() {
    return _firestore
        .collection("incidents")
        // .orderBy("date", descending: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((doc) => IncidentModel.fromDocumentSnapshot(
                id: doc.id,
                documentSnapshot: doc.data() as Map<String, dynamic>))
            .toList());
  }

  Future<bool> registerUser(UserModel user) async {
    try {
      // update user
      await _firestore.collection("users").doc(user.id).update({
        "name": user.name,
        "phone": user.phone,
        "email": user.email,
        "nic": user.nic,
        "role": user.role,
        "profilePicRef": user.profilePicRef,
        "bank": user.bank!.toMap(),
        "farm": user.farm!.toMap()
      });

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> updateOfficer(UserModel user) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id)
          .update({"name": user.name, "phone": user.phone, "nic": user.nic});
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<List<String>> getCropTypes() async {
    try {
      List<String> cropTypeNames = [];

      QuerySnapshot _query = await _firestore.collection("crops").get();
      for (var _doc in _query.docs) {
        cropTypeNames.add(_doc["name"]);
      }
      return cropTypeNames;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<bool> createIncident(IncidentModel incident) async {
    List media = incident.media!.map((e) => e.toMap()).toList();
    try {
      await _firestore.collection("incidents").add({
        "types": incident.types,
        "description": incident.description,
        "media": media,
        "acres": incident.acres,
        "date": incident.date,
        "status": incident.status!.name,
        "user": incident.user!.toMap()
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
