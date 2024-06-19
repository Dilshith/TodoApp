import 'package:flutter/material.dart';
import 'package:todoapp/db/db_functions.dart';
// import 'package:get/get.dart';

class FloatingAction extends StatelessWidget {
  FloatingAction({super.key});
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.yellow,
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx1) {
              return AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Add Task"),
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.yellow,
                actions: [
                  ElevatedButton(
                      onPressed: () async {
                        await ToDoDbFunctions().addTask(textController.text);
                        textController.clear();
                      },
                      child: const Text("Add")),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                ],
              );
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
