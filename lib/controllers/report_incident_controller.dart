import 'package:cropify/models/crop_type.dart';
import 'package:get/get.dart';

import '../services/database.dart';

class ReportIncidentController extends GetxController {
  final List<CropType> _cropTypeList = <CropType>[].obs;

  List<CropType>? get crops => _cropTypeList;

  @override
  onInit() {
    cropTypes();
    super.onInit();
  }

  void cropTypes() async {
    _cropTypeList.assignAll(await Database().getCropTypes());
  }
}
