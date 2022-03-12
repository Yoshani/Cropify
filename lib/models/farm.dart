import 'package:cloud_firestore/cloud_firestore.dart';

class FarmModel {
  String? id;
  String? userId;
  String? name;
  String? address;
  String? regNum;

  FarmModel({this.id, this.userId, this.name, this.address, this.regNum});

  FarmModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    userId = documentSnapshot["userId"];
    name = documentSnapshot["name"];
    address = documentSnapshot["address"];
    regNum = documentSnapshot["regNum"];
  }
}
