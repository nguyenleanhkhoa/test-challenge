part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class ChangePageEvent extends TodoEvent {
  final int indexPage;
  ChangePageEvent(this.indexPage);
}

class ShowTodoListEvent extends TodoEvent {
  final List<Todo> listTodo;
  ShowTodoListEvent(this.listTodo);
}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

class updateListEvent extends TodoEvent {
  final int index;
  final bool complete;
  updateListEvent(this.index, this.complete);
}
