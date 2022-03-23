import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/user.dart';

class IncidentModel {
  String? id;
  List? types;
  String? description;
  double? acres;
  List? media;
  Timestamp? date;
  String? status;
  UserAvatar? user;

  IncidentModel(
      {this.id,
      this.types,
      this.description,
      this.acres,
      this.media,
      this.date,
      required this.status});

  IncidentModel.fromDocumentSnapshot(
      {required Map<String, dynamic> documentSnapshot}) {
    id = documentSnapshot["id"];
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    acres = documentSnapshot["acres"];
    media = documentSnapshot["media"];
    date = documentSnapshot["date"];
    status = documentSnapshot["status"];
    user = UserAvatar.fromData(documentSnapshot["user"]);
  }
}
