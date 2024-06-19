import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoapp/Apphome.dart';
import 'package:todoapp/db/db_functions.dart';
import 'package:todoapp/models/todomodel.dart';
// import 'package:todoapp/models/todomodel.dart';

class Cont extends StatefulWidget {
  final TodoModel data;
  Cont({super.key, required this.data});
  @override
  State<Cont> createState() => _ContState();
}

class _ContState extends State<Cont> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
      child: Container(
        width: 600,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Checkbox(
                // This bool value toggles the switch.
                value: widget.data.value,
                onChanged: (value) async {
                  await ToDoDbFunctions().markDone(widget.data.id!);
                  setState(() {
                    widget.data.value = value!;
                  });
                },
              ),
              const SizedBox(width: 10),
              widget.data.value == false
                  ? Text(widget.data.name)
                  : Text(
                      widget.data.name,
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
              IconButton(
                  onPressed: () {
                    ToDoDbFunctions().deleteTask(widget.data.id!);
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
