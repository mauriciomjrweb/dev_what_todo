import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime createdTime;

  Todo({
    required this.title,
    required this.createdTime,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
}
