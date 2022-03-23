import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? nic;
  String? role;
  String? profilePicRef;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.nic,
      this.role,
      this.profilePicRef});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    phone = documentSnapshot["phone"];
    email = documentSnapshot["email"];
    nic = documentSnapshot["nic"];
    role = documentSnapshot["role"];
    profilePicRef = documentSnapshot["profilePicRef"];
  }
}

class UserAvatar {
  String? userId;
  String? name;
  String? address;
  String? bankName;
  String? accountNum;

  UserAvatar.fromData(Map<String, dynamic> data) {
    userId = data["userId"];
    name = data["name"];
    address = data["address"];
    bankName = data["bankName"];
    accountNum = data["accountNum"];
  }
}
