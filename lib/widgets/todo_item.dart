import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do_item.dart';

class ToDoItem extends StatefulWidget {
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
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool checkBoxVal = false;

  @override
  void initState() {
    checkBoxVal = widget.todo.isDone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        // onTap: () {
        //   widget.onToDoChanged(widget.todo);
        // },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Checkbox(
          value: checkBoxVal,
          side: BorderSide(
            color: Color(0xff187585),
            width: 1.5,
          ),
          onChanged: (newValue) {
            setState(() {
              checkBoxVal = newValue!;
            });
          },
        ),
        // leading: Icon(
        //   todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
        //   color: Color(0xff187585),
        // ),
        title: Text(
          widget.todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff0b2e35),
            decoration: checkBoxVal ? TextDecoration.lineThrough : null,
            // decoration: widget.todo.isDone ? TextDecoration.lineThrough : null,
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
              // onDeleteItem(todo.id);
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
