import 'package:cloud_firestore/cloud_firestore.dart';

class IncidentModel {
  String? id;
  String? userId;
  String? types;
  String? description;
  int? acres;
  Timestamp? date;
  String? status;

  IncidentModel(
      {this.id,
      this.userId,
      this.types,
      this.description,
      this.acres,
      this.date,
      required this.status});

  IncidentModel.fromDocumentSnapshot(
      {required Map<String, dynamic> documentSnapshot}) {
    id = documentSnapshot["id"];
    userId = documentSnapshot["userId"];
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    acres = documentSnapshot["acres"];
    date = documentSnapshot["date"];
    status = documentSnapshot["status"];
  }
}
