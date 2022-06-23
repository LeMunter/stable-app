import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stable/models/models.dart';
import 'package:stable/widgets/widgets.dart';

class TaskScreen extends StatefulWidget {
  static Route route(Task task) => MaterialPageRoute(
      builder: (context) => TaskScreen(
        task: task
      ),
  );

  const TaskScreen({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: CupertinoIcons.back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: Text(widget.task.name),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: IconBorder(
                  icon: CupertinoIcons.pen,
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: IconBorder(
                  icon: CupertinoIcons.delete,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Text('Hej'),
            ),
            // const _ActionBar(),
          ],
        ),
      ),
    );
  }
}
