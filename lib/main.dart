import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // ignore: prefer_const_constructors
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home:HomePage(),
      theme:ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

