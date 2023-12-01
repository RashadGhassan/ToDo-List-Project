class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  int? user;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [];
  }
}
