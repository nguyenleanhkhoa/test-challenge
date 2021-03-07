import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/src/widgets/itemList.widget.dart';

class TodoAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        // do some thing here
      },
      builder: (context, state) {
        if (state is ShowListState) {
          final listTodo = state.listTodo;
          return Container(
            child: ListView.builder(
                itemCount: listTodo.length,
                itemBuilder: (context, index) {
                  return ItemList(
                    todo: listTodo[index],
                  );
                }),
          );
        }
        return Container(
          width: 0.0,
          height: 0.0,
        );
      },
    );
  }
}
