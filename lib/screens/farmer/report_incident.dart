import 'package:cropify/controllers/report_incident_controller.dart';
import 'package:cropify/screens/common/appbar.dart';
import 'package:cropify/screens/farmer/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ReportIncident extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController acresController = TextEditingController();

  ReportIncident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: const CropifyAppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: const Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Report  Incident",
                        style: TextStyle(
                            fontFamily: "AbhayaLibre",
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/vegies-other.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 150,
                width: double.infinity,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text("Damaged Crop Types"),
                            ),
                            Expanded(
                                child: Container(
                              child: GetX<ReportIncidentController>(
                                builder: (_) {
                                  if (_.crops!.isNotEmpty) {
                                    return MultiSelectDialogField(
                                      items: _.crops!
                                          .map((e) =>
                                              MultiSelectItem(e, e.name!))
                                          .toList(),
                                      listType: MultiSelectListType.CHIP,
                                      onConfirm: (values) {
                                        // _selectedCropTypes = values;
                                      },
                                    );
                                  } else {
                                    return const Center(
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child:
                                                CircularProgressIndicator()));
                                  }
                                },
                              ),
                              constraints: const BoxConstraints(
                                  minHeight: 100, minWidth: double.infinity),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 2, 70, 2),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text("Acres Affected"),
                            ),
                            Container(
                              child: TextFormField(
                                controller: acresController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'(^\d*\.?\d*)')),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Number of acres",
                                  hintStyle: TextStyle(fontSize: 10),
                                ),
                              ),
                              height: 50,
                              width: (MediaQuery.of(context).size.width) / 3,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 2, 70, 2),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text("Description"),
                            ),
                            Expanded(
                                child: Container(
                              child: TextFormField(
                                controller: descriptionController,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  hintText: "Describe your incident...",
                                  hintStyle: TextStyle(fontSize: 10),
                                ),
                              ),
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 2, 70, 2),
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text("Photos & Videos"),
                            ),
                            Expanded(
                                child: SizedBox(
                              child: OutlinedButton.icon(
                                icon: const Icon(Icons.image),
                                label: const Text(
                                  "Select Images/Videos",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () => {
                                  Get.dialog(Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Camera(),
                                    ],
                                  )),
                                },
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1.0,
                                      color: Color.fromARGB(255, 2, 70, 2)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                              ),
                              height: 50,
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: const Text("Submit"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
