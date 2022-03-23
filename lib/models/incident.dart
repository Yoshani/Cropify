import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/user.dart';

class IncidentModel {
  String? id;
  String? types;
  String? description;
  int? acres;
  Timestamp? date;
  String? status;
  UserAvatar? user;

  IncidentModel(
      {this.id,
      this.types,
      this.description,
      this.acres,
      this.date,
      required this.status});

  IncidentModel.fromDocumentSnapshot(
      {required Map<String, dynamic> documentSnapshot}) {
    id = documentSnapshot["id"];
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    acres = documentSnapshot["acres"];
    date = documentSnapshot["date"];
    status = documentSnapshot["status"];
    user = UserAvatar.fromData(documentSnapshot["user"]);
  }
}
