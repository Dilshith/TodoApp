import 'package:hive_flutter/adapters.dart';
part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  bool value;

  @HiveField(2)
  int? id;

  TodoModel({required this.name, required this.value, this.id});
}
