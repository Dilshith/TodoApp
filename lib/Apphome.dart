import 'package:flutter/material.dart';
import 'package:todoapp/Screens/container.dart';
import 'package:todoapp/Screens/floatingactn.dart';
import 'package:todoapp/db/db_functions.dart';
import 'package:todoapp/models/todomodel.dart';
// import 'package:todoapp/models/todomodel.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingAction(),
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("T O  D O"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 230, 0),
          elevation: 5,
          shadowColor: Colors.black,
        ),
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: ToDoDbFunctions().allTaskNotifier,
                builder: (BuildContext ctx, List<TodoModel> dataList, _) {
                  return ListView.separated(
                      itemBuilder: (ctxt, index) {
                        final data = dataList[index];
                        return Cont(
                          data: data,
                        );
                      },
                      separatorBuilder: (ctxt, index) {
                        return const SizedBox();
                      },
                      itemCount: dataList.length);
                })));
  }
}

Onchanged() {
  false;
}
