import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async' show Future;
import 'dart:io';
import 'package:todo_app/models/task.dart';

class DomainTask {
  Database taskTable;

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "task.db");

    this.taskTable = await openDatabase(
      path,
      version: 1,
      onCreate: (db, int version) {
        /// DBがpathに存在しなかった場合のことを考慮している
        db.execute("""
          CREATE TABLE task (
            id INTEGER PRIMARY KEY,
            content TEXT,
            isComplete INTEGER
          )
        """);
      },
    );
  }

  Future<void> insert(int id, String content) async {
    final Database database = taskTable;
    final taskInstance = Task(
      id: id,
      content: content
    );

    await database.insert(
      'task',
      taskInstance.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}