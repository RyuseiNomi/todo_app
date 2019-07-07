import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Task(title: 'TODOアプリ'),
    );
  }
}

class Task extends StatefulWidget {
  Task({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<String> _task = new List();
  TextEditingController taskCtrl = TextEditingController();

  void _setTask(String task) {
    setState(() {
      this._task.add(task);
    });
  }

  List<String> _getAllTask() {
    setState(() {
      return this._task;
    });
  }

  int _returnTaskLength() {
    return this._task.length;
  }

  void _deleteTask(int index) {
    setState(() {
      this._task.removeAt(index);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'タスクを入力してください',
            ),
            TextField(
              controller: this.taskCtrl,
              decoration: InputDecoration(hintText: 'ピーマンを買う', labelText: '内容'),
              style: Theme.of(context).textTheme.display1,
            ),
            Flexible(
              child: _returnTaskLength() == 0
                ? Center(child: Text('タスクはありません'))
                : Center(child: 
                  ListView.builder(
                    itemCount: this._task.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(_task[index]),
                            ),
                            ButtonTheme.bar(
                              child: ButtonBar(
                                children: <Widget>[
                                  FlatButton(
                                    child: const Text('完了'),
                                    onPressed: () => _deleteTask(index),
                                  )
                                ],),
                            )
                          ],)
                        );
                    },
                  ))
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _setTask(this.taskCtrl.text),
        tooltip: 'Taskの追加',
        child: Icon(Icons.add),
      ),
    );
  }
}
