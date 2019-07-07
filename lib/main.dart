import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

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
  Map _task = new Map();

    // ユーザが入力した日付を格納する変数
  var _dueDateTime = new DateTime.now();

  // 日付のフォーマッター
  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  TextEditingController taskCtrl = TextEditingController();

  /**
   * 入力されたタスクを画面に描画する
   * 
   * @param String date タスクの期日
   * @param String content タスクの内容
   */
  void _setTask(DateTime date, String content) {
    setState(() {
      this._task.put();
    });
    print(this._task);
  }

  /**
   * 現在あるタスクを全て画面に描画する
   * 
   * @return array 全てのタスク
   */
  List<String> _getAllTask() {
    setState(() {
      return this._task;
    });
  }

  /**
   * タスクの有無を判断するためにタスク配列の長さを返すメソッド
   * 
   * @return int タスク配列の長さ
   */
  int _getTaskLength() {
    return this._task.length;
  }

  /**
   * 引数で指定されたインデックスのタスクを配列から削除する
   * 
   * @param int 配列のインデックス
   */
  void _deleteTask(int index) {
    setState(() {
      this._task.remove(index);
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
            FlatButton(
              onPressed: () => 
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date){ //onConfirmを使うことで、Doneを押した時のイベントを設定できる
                    setState(() {
                      this._dueDateTime = date; //選択された日付をクラスプロパティに格納
                    });
                  }), 
              child: Text(
                formatter.format(this._dueDateTime),
              )
            ),
            Flexible(
              child: _getTaskLength() == 0 //タスクがあるかどうかを判定
                ? Center(child: Text('タスクはありません'))
                : Center(child:
                  ListView.builder( //タスクがある場合は配列の長さの分だけCardウィジットを生成
                    itemCount: this._task.length,
                    itemBuilder: (context, int index) {
                      return Card( //タスク表示のDOM
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(_task['content'][index]),
                            ),
                            ButtonTheme.bar( //タスクCardにボタンを付けるときはこのWidgetのchildrenに追加する
                              child: ButtonBar(
                                children: <Widget>[
                                  Text(
                                    _task['date'][index]
                                  ),
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
        onPressed: () => _setTask(this._dueDateTime, this.taskCtrl.text), //TODO Class 'DateTime' has no instance method '[]'.←このエラーを解決する
        tooltip: 'Taskの追加',
        child: Icon(Icons.add),
      ),
    );
  }
}
