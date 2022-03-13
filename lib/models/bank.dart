import 'package:cloud_firestore/cloud_firestore.dart';

class BankModel {
  String? id;
  String? userId;
  String? name;
  String? accountNum;

  BankModel({this.id, this.userId, this.name, this.accountNum});

  BankModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    userId = documentSnapshot["userId"];
    name = documentSnapshot["name"];
    accountNum = documentSnapshot["accountNum"];
  }
}
