import 'package:image_picker/image_picker.dart';

class Media {
  XFile file;
  String type;

  Media({required this.file, required this.type});
}

class MediaDTO {
  String? mediaRef;
  String? type;
  String? thumbnail;

  MediaDTO({this.mediaRef, this.type, this.thumbnail});

  MediaDTO.fromData(Map<String, dynamic> data) {
    mediaRef = data["mediaRef"];
    type = data["type"];
    thumbnail = data["thumbnail"] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'mediaRef': mediaRef,
      'type': type,
    };
  }
}
