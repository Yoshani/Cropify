import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../controllers/auth_controller.dart';
import '../common/appbar.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CropifyAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: emailController,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  controller.createUser(
                      emailController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
