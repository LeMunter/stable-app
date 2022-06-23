import 'package:meta/meta.dart';
import 'package:stable/models/task.dart';

class Horse {
  Horse({
    required this.name,
    required this.imgUrl,
    required this.tasks
  });

  final String name;
  final String imgUrl;
  List<Task> tasks;
}