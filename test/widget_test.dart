// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';
import 'package:todo_app/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/src/data/data.dart';
import 'package:todo_app/src/models/todo.model.dart';

void main() {
  // TodoBloc todoBloc;
  // setUp(() {
  //   todoBloc = TodoBloc();
  // });
  // test("Insert Todo", () {
  //   var todo = Todo(
  //       id: Data.listTodo.length + 1,
  //       note: "task 1",
  //       task: "content example 1",
  //       complete: false);
  //   todoBloc.add(AddTodoEvent(todo));
  // });
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
