import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    String? token = await _fcm.getToken();
    print("Token body" + token!);

    FirebaseMessaging.onMessage.listen((event) {
      print("Meesage Recieved" + event.notification!.body!);
      Get.defaultDialog(
          title: "Notification", content: Text(event.notification!.body!));
    });

    FirebaseMessaging.onMessage.listen((event) {
      print("Message Open");
    });
  }

  Future<String?> getFcmToken() {
    return _fcm.getToken();
  }

  Future<void> sendMessage(String to, Map<String, String> data) {
    return _fcm.sendMessage(to: to, data: data, messageId: "qwe", ttl: 1);
  }
}
