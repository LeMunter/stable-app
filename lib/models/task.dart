import 'package:flutter/material.dart';

class Task {
  Task({required this.name, required this.time, required this.icon, required this.isDone});

  final IconData icon;
  final String name;
  bool isDone;
  final String time;


// final Icon icon;
}