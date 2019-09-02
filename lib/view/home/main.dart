import 'package:flutter/material.dart';
import 'package:todo_app/view/home/body.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ToDoアプリ"),
        ),
        body: Center(
          child: Body(),
        )
      ),
    );
  }
}
