import 'package:flutter/material.dart';
import 'package:todo_app/models/domainTask.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController taskCtrl = TextEditingController();
  DomainTask domainTask = DomainTask();

  @override
  void initState() {
    domainTask.init();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        OutlineButton(
          onPressed: () => setState(() { domainTask.insert(0, this.taskCtrl.text); }),
          child: Text("追加", style: TextStyle(color: Colors.blue),),
          borderSide: BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        // Flexible(
        //   child: task.getTaskLength() == 0 //タスクがあるかどうかを判定
        //     ? Center(child: Text('タスクはありません'))
        //     : Center(child:
        //       ListView.builder( //タスクがある場合は配列の長さの分だけCardウィジットを生成
        //         itemCount: task.task.length,
        //         itemBuilder: (context, int index) {
        //           return Card( //タスク表示のDOM
        //             child: Column(
        //               children: <Widget>[
        //                 ListTile(
        //                   title: Text(task.task[index]),
        //                 ),
        //                 ButtonTheme.bar( //タスクCardにボタンを付けるときはのWidgetのchildrenに追加する
        //                   child: ButtonBar(
        //                     children: <Widget>[
        //                       FlatButton(
        //                         child: const Text('完了'),
        //                         onPressed: () => setState(() {task.deleteTask(index);}),
        //                       )
        //                     ],),
        //                 )
        //               ],)
        //             );
        //         },
        //       ))
        // ),
      ],
    );
  }
}