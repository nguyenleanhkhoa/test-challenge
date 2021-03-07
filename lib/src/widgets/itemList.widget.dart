import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/src/models/todo.model.dart';

class ItemList extends StatefulWidget {
  final Todo todo;

  const ItemList({Key key, this.todo}) : super(key: key);
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  TodoBloc todoBloc;
  @override
  void initState() {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.complete,
          onChanged: (val) {
            setState(() {
              widget.todo.complete = val;
            });
            todoBloc.add(updateListEvent(widget.todo.id, val));
          },
        ),
        title: Text(widget.todo.task),
        subtitle: Text(widget.todo.note),
      ),
    );
  }
}
