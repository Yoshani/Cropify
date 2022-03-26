import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/media.dart';
import 'package:cropify/models/incident_status.dart';
import 'package:cropify/models/user.dart';

class IncidentModel {
  String? id;
  String? types;
  String? description;
  double? acres;
  List<MediaDTO>? media;
  Timestamp? date;
  IncidentStatus? status;
  UserAvatar? user;
  Timestamp? reviewDate;
  Timestamp? completeDate;
  Timestamp? rejectDate;
  double? amount;
  String? comment;

  IncidentModel(
      {this.id,
      this.types,
      this.description,
      this.acres,
      this.media,
      this.date,
      required this.status,
      this.user,
      this.reviewDate,
      this.completeDate,
      this.rejectDate,
      this.amount,
      this.comment});

  IncidentModel.fromDocumentSnapshot(
      {required this.id, required Map<String, dynamic> documentSnapshot}) {
    types = documentSnapshot["types"];
    description = documentSnapshot["description"];
    acres = documentSnapshot["acres"];
    media = (documentSnapshot["media"] as List<dynamic>)
        .map((mediaItem) => MediaDTO.fromData(mediaItem))
        .toList();
    date = documentSnapshot["date"];
    status = getStatus(documentSnapshot["status"]);
    user = UserAvatar.fromData(documentSnapshot["user"]);
    reviewDate = documentSnapshot["reviewDate"];
    completeDate = documentSnapshot["completeDate"];
    rejectDate = documentSnapshot["rejectDate"];
    amount = documentSnapshot["amount"];
    comment = documentSnapshot["comment"];
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
    case "REJECTED":
      return IncidentStatus.REJECTED;
    default:
      return IncidentStatus.NEW;
  }
}
