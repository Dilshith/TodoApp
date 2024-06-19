import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/models/todomodel.dart';
import 'package:todoapp/utils/constants.dart';

abstract class DbFunctions {
  Future<void> addTask(String taskName);
  Future<void> getData();
  Future<void> deleteTask(int id);
  Future<void> markDone(int id);
}

class ToDoDbFunctions implements DbFunctions {
  ValueNotifier<List<TodoModel>> allTaskNotifier = ValueNotifier([]);

//CREATED SINGLETON
  ToDoDbFunctions._internal();
  static ToDoDbFunctions instance = ToDoDbFunctions._internal();
  factory ToDoDbFunctions() {
    return instance;
  }

  @override
  Future<void> addTask(String taskName) async {
    final box = await Hive.openBox<TodoModel>(DbCredentials.TO_DB_NAME);
    final data = TodoModel(name: taskName, value: false);
    int id = await box.add(data);
    data.id = id;
    await box.put(id, data);
    await getData();
  }

  @override
  Future<void> deleteTask(int id) async {
    final box = await Hive.openBox<TodoModel>(DbCredentials.TO_DB_NAME);
    await box.delete(id);
    await getData();
  }

  @override
  Future<void> markDone(int id) async {
    final box = await Hive.openBox<TodoModel>(DbCredentials.TO_DB_NAME);
    TodoModel data = box.get(id)!;
    data.value = true;
    await box.put(id, data);
    await getData();
  }

  @override
  Future<void> getData() async {
    final box = await Hive.openBox<TodoModel>(DbCredentials.TO_DB_NAME);
    allTaskNotifier.value.clear();
    allTaskNotifier.value.addAll(box.values.toList());
    allTaskNotifier.notifyListeners();
  }
}
