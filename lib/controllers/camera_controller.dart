import 'dart:io';

import 'package:cropify/models/media.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  static const platform = MethodChannel('critify.flutter.dev/file_attr');

  var selectedImagePath = ''.obs;
  final RxList<Media> _mediaList = <Media>[].obs;
  final Rx<int> _visibleFileIndex = 0.obs;

  List<Media>? get medias => _mediaList;
  int? get visibleFileIndex => _visibleFileIndex.value;

  void swipeRight() {
    if (_visibleFileIndex.value < _mediaList.length - 1) {
      _visibleFileIndex.value++;
    }
  }

  void swipeLeft() {
    if (_visibleFileIndex.value != 0) {
      _visibleFileIndex.value--;
    }
  }

  void pickImageFromGallery() async {
    // FilePickerResult? result = await FilePicker.platform
    //     .pickFiles(allowMultiple: false, type: FileType.image);

    // if (result != null) {
    //   PlatformFile file = result.files.first;
    //   print("--------------");
    //   print(file.path);

    //   List<File> files = result.paths.map((path) => File(path!)).toList();
    //   print("--------------" + files[0].path);
    // }

    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      // DateTime createdDate = await File(pickedFiles[0].path).lastModified();

      // print("-----------------------------------");
      // File file = File(pickedFiles[0].path);
      // print(pickedFiles[0].path);
      // print(createdDate);
      _mediaList
          .addAll(pickedFiles.map((file) => Media(file: file, type: "Image")));
    }
  }

  void pickImageFromCamera(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _mediaList.add(Media(file: pickedFile, type: "Image"));
    }
  }

  void pickVideo(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickVideo(source: imageSource);

    if (pickedFile != null) {
      _mediaList.add(Media(file: pickedFile, type: "Video"));
    }
  }

  Future<String> responseFromNativeCode(String filePath) async {
    String response = '';
    try {
      final String result = await platform
          .invokeMethod('getFileCreationDate', {"filePath": filePath});
      response = result;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("${e.message}");
      }
    }
    return response;
  }
}
