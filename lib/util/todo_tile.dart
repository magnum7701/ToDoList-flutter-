import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.taskname,
    required this.taskcompleted,
    required this.onchanged,
    required this.deleteFunction});

  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext?)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
      top:25,
      bottom:4,
      left:15,
      right:18
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const StretchMotion(), 
            children:[
              SlidableAction(
                  onPressed:deleteFunction,
                  icon:Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.red,
            )
         ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Colors.purple[600],
          borderRadius: BorderRadius.circular(15)
          ),
            child: Row(
              children: [
                Checkbox(
                    value: taskcompleted,
                    onChanged: onchanged,
                    checkColor: Colors.purple,
                    activeColor: Colors.white,
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.white,
                    ),
                ),
        
                Text(
                taskname,
                style:  TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: taskcompleted?
                TextDecoration.lineThrough:
                TextDecoration.none,
                decorationColor: Colors.white,
                  decorationThickness: 2
                )
                ),
              ],
            )
          ),
      ),
      );
  }
}
