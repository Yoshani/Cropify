import 'package:flutter/material.dart';

class CropifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CropifyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text(
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
        backgroundColor: const Color.fromARGB(255, 6, 182, 85));
  }
}
