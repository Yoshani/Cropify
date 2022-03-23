import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/models/user.dart';

class IncidentModel {
  String? id;
  String? types;
  String? description;
  int? acres;
  Timestamp? date;
  IncidentStatus? status;
  UserAvatar? user;

  IncidentModel(
      {this.id,
      this.types,
      this.description,
      this.acres,
      this.date,
      required this.status});

  IncidentModel.fromDocumentSnapshot(
      {required this.id, required Map<String, dynamic> documentSnapshot}) {
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    acres = documentSnapshot["acres"];
    date = documentSnapshot["date"];
    status = getStatus(documentSnapshot["status"]);
    user = UserAvatar.fromData(documentSnapshot["user"]);
  }
}

IncidentStatus getStatus(String status) {
  switch (status) {
    case "NEW":
      return IncidentStatus.NEW;
    case "IN_PROGRESS":
      return IncidentStatus.IN_PROGRESS;
    case "COMPLETED":
      return IncidentStatus.COMPLETED;
    default:
      return IncidentStatus.NEW;
  }
}
