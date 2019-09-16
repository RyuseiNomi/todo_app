import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async' show Future;
import 'dart:io';

class Task {

  Database db;

  final int id;
  final String content;
  final DateTime dueDate;
  final int isComplete; /// bool型が使えないためintegerで表現

  Task({this.id, this.content, this.dueDate, this.isComplete});

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "task.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        /// DBがpathに存在しなかった場合のことを考慮している
        newDb.execute("""
          CREATE TABLE task (
            id INTEGER PRIMARY KEY,
            content TEXT,
            dueDate DATETIME,
            isComplete INTEGER
          )
        """);
      },
    );

    print('finished to init db');
  }

  List<String> task = new List();

  /// 入力されたタスクを画面に描画する
  /// 
  /// @param String タスク内容 ex) ピーマンを買う
  void setTask(String taskContents) {
      this.task.add(taskContents);
  }

  /// 現在あるタスクを全て画面に描画する
  ///
  /// @return array 全てのタスク
  List<String> getAllTask() {
      return this.task;
  }

  /// タスクの有無を判断するためにタスク配列の長さを返すメソッド
  /// 
  /// @return int タスク配列の長さ
  int getTaskLength() {
    return this.task.length;
  }

  /// 引数で指定されたインデックスのタスクを配列から削除する
  /// 
  /// @param int 配列のインデックス
  void deleteTask(int index) {
      this.task.removeAt(index);
  }
}