import 'package:flutter/material.dart';

class FarmerHome extends StatelessWidget {
  const FarmerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Text("Welcome")),
    );
  }
}