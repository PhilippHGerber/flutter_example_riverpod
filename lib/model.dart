import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool completed;

  Todo({
    required this.title,
    required this.description,
    required this.completed,
  });
}
