import 'package:to_do_list/models/firebase_service.dart';
import 'package:to_do_list/models/user_auth.dart';

class ToDo {
  // String? id;
  String? todoText;
  bool isDone;

  ToDo({
    // required this.id,
    required this.todoText,
    this.isDone = false,
  });

  Map<dynamic, dynamic> toMap() {
    return {
      // 'id': id,
      'todoText': todoText,
      'done': isDone,
    };
  }

  factory ToDo.fromMap(Map<dynamic, dynamic> map) {
    return ToDo(
      // id: map["id"],
      todoText: map["todoText"],
      isDone: map["done"],
    );
  }

  static List<ToDo> todoList() {
    return [];
  }
}
