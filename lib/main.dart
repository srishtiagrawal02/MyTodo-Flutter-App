
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';


void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Todo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
