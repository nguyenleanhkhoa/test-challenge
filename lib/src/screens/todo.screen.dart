import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/src/screens/todo_approved.screen.dart';
import 'package:todo_app/src/screens/todo_notapproved.screen.dart';
import 'package:todo_app/src/widgets/float_action_button.widget.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int _selectedIndex = 0;

  TodoBloc todoBloc;
  @override
  void initState() {
    todoBloc = BlocProvider.of<TodoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatActionButtonCustom(),
      appBar: AppBar(
        title: Text("Todo"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.delete), label: "Not Approved"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Appropved"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (ind) {
          setState(() {
            _selectedIndex = ind;
          });
        },
      ),
      body:
          _selectedIndex == 0 ? TodoNotApprovedScreen() : TodoApprovedScreen(),
    );
  }
}
