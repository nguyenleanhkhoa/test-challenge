import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/src/data/data.dart';
import 'package:todo_app/src/models/todo.model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is ChangePageEvent) {
      yield* eventChangePage(event.indexPage);
    } else if (event is updateListEvent) {
      yield* eventUpdateListTodo(event.index, event.complete);
    } else if (event is ShowTodoListEvent) {
      yield* eventShowList(event.listTodo);
    } else if (event is AddTodoEvent) {
      yield* eventAddTodo(event.todo);
    }
  }

  Stream<TodoState> eventAddTodo(Todo todo) async* {
    Data.listTodo.add(todo);
    yield ShowListState(Data.listTodo);
  }

  Stream<TodoState> eventShowList(List<Todo> listTodo) async* {
    yield ShowListState(listTodo);
  }

  Stream<TodoState> eventChangePage(int index) async* {
    if (index == 1) {
      yield ShowPageState.showPage(false);
    } else {
      yield ShowPageState.showPage(true);
    }
  }

  Stream<TodoState> eventUpdateListTodo(int id, bool complete) async* {
    // Todo itemTodo = Data.listTodo.where((element) => element.id == id).first;
    int index = Data.listTodo.indexWhere((element) => element.id == id);
    Data.listTodo[index].complete = complete;
    yield ShowListState(Data.listTodo);
  }
}
