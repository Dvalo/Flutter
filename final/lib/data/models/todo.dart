class ToDo {
  String id;
  String title;
  String todoTask;
  String todoDescription;
  bool completed;
  String createdBy;

  ToDo(
      {this.id,
      this.title,
      this.todoTask,
      this.todoDescription,
      this.completed,
      this.createdBy});

  ToDo.fromMap(Map snapshot, String id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        todoTask = snapshot['todoTask'] ?? '',
        todoDescription = snapshot['todoDescription'] ?? '',
        completed = snapshot['completed'] ?? false,
        createdBy = snapshot['createdBy'] ?? '';

  toJson() {
    return {
      "title": title,
      "todoTask": todoTask,
      "todoDescription": todoDescription,
      "completed": completed,
      "createdBy": createdBy,
    };
  }
}
