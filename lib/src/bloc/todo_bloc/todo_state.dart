part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class ShowPageState extends TodoState {
  bool checkedPage = false;
  ShowPageState({this.checkedPage});

  factory ShowPageState.showPage(checkedPage) {
    return ShowPageState(
      checkedPage: checkedPage,
    );
  }
}

class ShowListState extends TodoState {
  final List<Todo> listTodo;
  ShowListState(this.listTodo);
}

class updateSuccess extends TodoState {}
