import 'package:cropify/controllers/report_incident_controller.dart';
import 'package:cropify/models/crop_type.dart';
import 'package:cropify/screens/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../controllers/auth_controller.dart';

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
                              height: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 2, 70, 2),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(8),
                        //   child: Container(
                        //     width: 60,
                        //     height: 90,
                        //     decoration: BoxDecoration(
                        //       border: Border.all(
                        //         color: Colors.indigo,
                        //       ),
                        //       borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     ),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     //increase quantity
                        //     GestureDetector(
                        //       child: Icon(
                        //         Icons.add,
                        //         color: Colors.indigo[900],
                        //         size: 25,
                        //       ),
                        //       onTap: () {
                        //         Get.find<ReportIncidentController>().increment();
                        //       },
                        //     ),
                        //     const SizedBox(width: 10.0),
                        //     GetBuilder<ReportIncidentController>(
                        //       init: ReportIncidentController(),
                        //       builder: (_) => Text(
                        //         '${_.acres}',
                        //         style: TextStyle(
                        //           color: Colors.indigo[900],
                        //           fontWeight: FontWeight.w900,
                        //           fontSize: 25,
                        //         ),
                        //       ),
                        //     ),

                        //     const SizedBox(width: 10.0),
                        //     //decrease quantity
                        //     GestureDetector(
                        //       child: Icon(
                        //         Icons.remove,
                        //         color: Colors.indigo[900],
                        //         size: 25,
                        //       ),
                        //       onTap: () {
                        //         //cannot decrease quantity below 1
                        //         if (Get.find<ReportIncidentController>().acres !=
                        //             1) {
                        //           Get.find<ReportIncidentController>()
                        //               .decrement();
                        //         }
                        //       },
                        //     ),
                        //   ],
                        // ),
                        //   ),
                        // )
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
