import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropify/models/bank.dart';
import 'package:cropify/models/farm.dart';

class UserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? nic;
  String? role;
  String? profilePicRef;
  BankModel? bank;
  FarmModel? farm;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.nic,
      this.role,
      this.profilePicRef,
      this.bank,
      this.farm});

  // UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
  //   id = documentSnapshot.id;
  //   name = documentSnapshot["name"];
  //   phone = documentSnapshot["phone"];
  //   email = documentSnapshot["email"];
  //   nic = documentSnapshot["nic"];
  //   role = documentSnapshot["role"];
  //   profilePicRef = documentSnapshot["profilePicRef"];
  //   // TODO: get bank and farm if needed
  // }

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    phone = documentSnapshot["phone"];
    email = documentSnapshot["email"];
    nic = documentSnapshot["nic"];
    role = documentSnapshot["role"];
    profilePicRef = documentSnapshot["profilePicRef"];
    bank = BankModel.fromData(documentSnapshot["bank"]);
    farm = FarmModel.fromData(documentSnapshot["farm"]);
  }
}

class UserAvatar {
  String? userId;
  String? name;
  String? address;
  String? bankName;
  String? accountNum;

  UserAvatar({
    this.userId,
    this.name,
    this.address,
    this.bankName,
    this.accountNum,
  });

  UserAvatar.fromData(Map<String, dynamic> data) {
    userId = data["userId"];
    name = data["name"];
    address = data["address"];
    bankName = data["bankName"];
    accountNum = data["accountNum"];
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'address': address,
      'bankName': bankName,
      'accountNum': accountNum
    };
  }
}
