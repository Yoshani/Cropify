import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? nic;
  String? role;

  UserModel({this.id, this.name, this.email, this.nic, this.role});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    role = documentSnapshot["nic"];
    role = documentSnapshot["role"];
  }
}
