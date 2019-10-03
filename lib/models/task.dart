class Task {
  final int id;
  final String content;
  final int isComplete; /// bool型が使えないためintegerで表現

  Task({this.id, this.content, this.isComplete});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content
    };
  }
}