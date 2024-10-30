class ItemModel {
  dynamic? userId;
  dynamic? id;
  dynamic? title;
  dynamic? body;

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    userId = parsedJson['userId'];
    id = parsedJson['id'];
    title = parsedJson['title'];
    body = parsedJson['body'];
  }
}
