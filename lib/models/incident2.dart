import 'package:cloud_firestore/cloud_firestore.dart';

class IncidentModel {
  String? id;
  List? types;
  String? description;
  double? acres;
  List? media;
  Timestamp? date;
  String? status;
  String? userId;

  IncidentModel(
      {this.id,
      this.types,
      this.description,
      this.media,
      this.acres,
      this.date,
      required this.status});

  IncidentModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot["id"];
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    media = documentSnapshot["media"];
    acres = documentSnapshot["acres"];
    date = documentSnapshot["date"];
    status = documentSnapshot["status"];
    userId = documentSnapshot["userId"];
  }
}
