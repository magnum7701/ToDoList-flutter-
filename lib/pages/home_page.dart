import 'package:flutter/material.dart';
import 'package:todo_list/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist = [
    ['Complete homework', false],
    ['Drink coffee', false],
    ['Hello',true]
  ];
  final _controller = TextEditingController();
  void checkBoxChanged(int index){
    setState(() {
      todolist[index][1]=!todolist[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      if(_controller.text!='') {
        todolist.add([_controller.text, false]);
        _controller.clear();
      }
    });
  }

  void deleteTask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade600,

        title: const Text("To-Do"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),

        centerTitle: true,
      ),
      body: ListView.builder(itemCount: todolist.length,
          itemBuilder: (BuildContext context, index) {
            // ignore: prefer_const_constructors
            return ToDoList(
              taskname: todolist[index][0],
              taskcompleted: todolist[index][1],
              onchanged: (value)=> checkBoxChanged(index),
                deleteFunction: (context)=> deleteTask(index)
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(

            child:Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 25
              ),
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new task',
                    filled: true,
                    fillColor:Colors.white,
                     enabledBorder:OutlineInputBorder(
                       borderSide: const BorderSide(
                         color: Colors.white,
                       ),
                       borderRadius: BorderRadius.circular(15.0),
                     ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(
                       color: Colors.white,
                  ),
                borderRadius: BorderRadius.circular(15.0),
              )
                  ),
                        ),
            ),
          ),
          FloatingActionButton(
              onPressed: saveNewTask,
               child: const Icon(Icons.add),
          ),
        ],
      )
    );
  }
}
