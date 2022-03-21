import 'dart:io';

import 'package:cropify/controllers/camera_controller.dart';
import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends GetView<CameraController> {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CropifyAppBar(
        visible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.swipeLeft();
                        },
                        icon: const Icon(Icons.arrow_left_outlined),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          child: controller.medias!.isEmpty
                              ? FittedBox(
                                  child: Image.asset('assets/no-image.png'),
                                  fit: BoxFit.contain,
                                )
                              // : Image.file(File(controller.selectedImagePath.value))
                              : Image.file(File(controller
                                  .medias![controller.visibleFileIndex!]
                                  .file
                                  .path)),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 2, 70, 2),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.swipeRight();
                        },
                        icon: const Icon(Icons.arrow_right_outlined),
                      ),
                    ],
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  controller.pickImageFromGallery();
                },
                child: const Text("Camera")),
          ],
        ),
      ),
    );
  }
}
