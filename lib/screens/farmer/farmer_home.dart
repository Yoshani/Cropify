import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../services/database.dart';

class FarmerHome extends GetWidget<AuthController> {
  FarmerHome({Key? key}) : super(key: key);

  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<UserController>(
          initState: (_) async {
            Get.find<UserController>().user =
                await Database().getUser(Get.find<AuthController>().user!.uid);
          },
          builder: (_) {
            if (_.user.name != null) {
              return Text("Welcome " + _.user.name!);
            } else {
              return const Text("loading...");
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          )
        ],
      ),
      // body: Column(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 20,
      //     ),
      //     Text(
      //       "Add Todo Here:",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     Card(
      //       margin: EdgeInsets.all(20),
      //       child: Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: TextFormField(
      //                 controller: _todoController,
      //               ),
      //             ),
      //             IconButton(
      //               icon: Icon(Icons.add),
      //               onPressed: () {
      //                 if (_todoController.text != "") {
      //                   Database()
      //                       .addTodo(_todoController.text, controller.user.uid);
      //                   _todoController.clear();
      //                 }
      //               },
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     Text(
      //       "Your Todos",
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     GetX<TodoController>(
      //       init: Get.put<TodoController>(TodoController()),
      //       builder: (TodoController todoController) {
      //         if (todoController != null && todoController.todos != null) {
      //           return Expanded(
      //             child: ListView.builder(
      //               itemCount: todoController.todos.length,
      //               itemBuilder: (_, index) {
      //                 return TodoCard(
      //                     uid: controller.user.uid,
      //                     todo: todoController.todos[index]);
      //               },
      //             ),
      //           );
      //         } else {
      //           return Text("loading...");
      //         }
      //       },
      //     )
      //   ],
      // ),
    );
  }
}
