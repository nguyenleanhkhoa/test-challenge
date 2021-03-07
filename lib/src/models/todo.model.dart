import 'dart:convert';

List<Todo> TodoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String TodoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo({
    this.id,
    this.note,
    this.task,
    this.complete,
  });

  int id;
  String note;
  String task;
  bool complete;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        note: json["note"],
        task: json["task"],
        complete: json["complete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "task": task,
        "complete": complete,
      };
}
