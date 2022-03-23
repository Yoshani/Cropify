import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbar {
  Snackbar.showSuccess(String message) {
    _showSnackbar(message, Colors.greenAccent);
  }

  Snackbar.showError(String message) {
    _showSnackbar(message, Colors.redAccent);
  }

  void _showSnackbar(String message, Color bgColor) {
    Get.snackbar('', '',
        margin: EdgeInsets.all(0),
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: bgColor,
        titleText: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 5));
  }
}
