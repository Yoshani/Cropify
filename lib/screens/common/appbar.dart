import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class CropifyAppBar extends GetWidget<AuthController>
    implements PreferredSizeWidget {
  final bool visible;

  const CropifyAppBar({Key? key, this.visible = true}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            'Cropify',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w100,
                fontSize: 25,
                fontFamily: "Lobster",
                shadows: [
                  Shadow(
                      // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Color.fromARGB(255, 2, 70, 2)),
                  Shadow(
                      // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Color.fromARGB(255, 2, 70, 2)),
                  Shadow(
                      // topRight
                      offset: Offset(1.5, 1.5),
                      color: Color.fromARGB(255, 2, 70, 2)),
                  Shadow(
                      // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Color.fromARGB(255, 2, 70, 2)),
                ]),
          ),
        ),
        backgroundColor: const Color.fromRGBO(6, 182, 85, 1),
        actions: visible
            ? [
                PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: TextButton(
                                  child: const Text("Sign Out"),
                                  onPressed: () {
                                    Get.back();
                                    controller.signOut();
                                  })),
                        ])
              ]
            : []);
  }
}
