import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/src/data/data.dart';
import 'package:todo_app/src/models/todo.model.dart';

class FloatActionButtonCustom extends StatefulWidget {
  @override
  _FloatActionButtonCustomState createState() =>
      _FloatActionButtonCustomState();
}

class _FloatActionButtonCustomState extends State<FloatActionButtonCustom> {
  TextEditingController taskEditingController;

  TextEditingController noteEditingController;

  TodoBloc todoBloc;

  bool isApproved = false;

  @override
  void initState() {
    noteEditingController = TextEditingController();
    taskEditingController = TextEditingController();
    todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  void onAddTodo() {
    int index = Data.listTodo.length + 1;
    Todo _todo = Todo(
        id: index,
        task: taskEditingController.text,
        note: noteEditingController.text,
        complete: isApproved);
    todoBloc.add(AddTodoEvent(_todo));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _showMaterialDialog() {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Add new todo"),
                content: Container(
                  height: 180.0,
                  child: Column(
                    children: [
                      TextField(
                        controller: taskEditingController,
                        decoration: InputDecoration(
                            hintText: "Input task", labelText: 'Task'),
                      ),
                      TextField(
                        controller: noteEditingController,
                        decoration: InputDecoration(
                            hintText: "Input note", labelText: 'Note'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Add'),
                    onPressed: onAddTodo,
                  ),
                  FlatButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }

    return FloatingActionButton(
      onPressed: () {
        _showMaterialDialog();
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
