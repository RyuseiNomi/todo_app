class Task {
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