import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do_item.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Color(0xff187585),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff0b2e35),
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.circular(4),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
