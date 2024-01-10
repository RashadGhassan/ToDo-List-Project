import 'package:flutter/material.dart';
import 'package:to_do_list/models/to_do_item.dart';
import 'package:to_do_list/widgets/drawer.dart';
import 'package:to_do_list/widgets/todo_item.dart';
import 'package:to_do_list/models/user_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2D6D8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xff0b2e35),
        ),
      ),
      drawer: const DrawerWidget(),
      body: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final todoList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  //show created todos
  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  //search for a specific todo in the list
  void _runFilter(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  //hendle if todo is done
  bool _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    return todo.isDone;
  }

  //delete todo
  void _deleteToDoItem(String id) {
    setState(() {
      // todoList.removeWhere((item) => item.id == id);
    });
  }

  //add todo
  void _addToDoItem(String todo, var todoID) {
    setState(() {
      todoList.add(ToDo(
        // id: todoID,
        todoText: todo,
      ));
    });
    _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff0b2e35),
                      size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        "To Do List",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (ToDo item in _foundToDo.reversed)
                      ToDoItem(
                        todo: item,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: "Add New ToDo",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _handleTodos();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleTodos() async {
    try {
      final DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child("users");
      var todoID = DateTime.now().millisecondsSinceEpoch.toString();
      Map<dynamic, dynamic> task = {
        'todoText': _todoController,
        'done': false,
      };
      var userID = Auth().auth.currentUser!.uid;
      // Auth().auth.currentUser!.updateDisplayName(
      //     "${firstNameController.text} ${lastNameController.text}");

      todoRef.push();
      // .set(task).whenComplete(() {
      //   print("todo added to database");
      //   _addToDoItem(_todoController.text, todoID);
      // });
    } catch (e) {
      print("---- ERROR ----");
    }
  }

  final DatabaseReference todoRef =
      FirebaseDatabase.instance.ref().child("task");
}
