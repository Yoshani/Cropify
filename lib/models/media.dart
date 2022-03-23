import 'package:image_picker/image_picker.dart';

class Media {
  XFile file;
  String type;

  Media({required this.file, required this.type});
}

class MediaDTO {
  String? id;
  String? mediaRef;
  String? type;

  MediaDTO({this.id, this.mediaRef, this.type});

  MediaDTO.fromData(Map<String, dynamic> data) {
    id = data["id"];
    mediaRef = data["mediaRef"];
    type = data["type"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mediaRef': mediaRef,
      'type': type,
    };
  }
}
