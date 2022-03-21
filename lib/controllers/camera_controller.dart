import 'package:cropify/models/media.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  var selectedImagePath = ''.obs;
  final RxList<Media> _mediaList = <Media>[].obs;
  final Rx<int> _visibleFile = 0.obs;
  Rx<String> visibleMediaPath = ''.obs;

  List<Media>? get medias => _mediaList;
  int? get visibleFileIndex => _visibleFile.value;

  void swipeRight() {
    if (_visibleFile.value < _mediaList.length - 1) {
      _visibleFile.value++;
    }
  }

  void swipeLeft() {
    if (_visibleFile.value != 0) {
      _visibleFile.value--;
    }
  }

  void pickImageFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();

    if (pickedFiles != null) {
      _mediaList
          .addAll(pickedFiles.map((file) => Media(file: file, type: "Image")));
    }
  }

  void pickImageFromCamera(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // selectedImagePath.value = pickedFile.path;
      _mediaList.add(Media(file: pickedFile, type: "Image"));
    }
  }

  void pickVideo(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickVideo(source: imageSource);

    if (pickedFile != null) {
      _mediaList.add(Media(file: pickedFile, type: "Video"));
    }
  }
}
