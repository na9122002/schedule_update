import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:wrok_app_1/models/item_api_model.dart';

class ApiProvider {
  final Client client = Client();
  Future<List<ItemModel>> fetchList() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print('nnnnn:${response.body.toString()}');
    if (response.statusCode == 200) {
      // Decode the response body as a JSON list
      final List<dynamic> jsonList =
          json.decode(utf8.decode(response.bodyBytes));

      // Convert each JSON object in the list to an ItemModel
      final List<ItemModel> listItem =
          jsonList.map((json) => ItemModel.fromJson(json)).toList();

      return listItem;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
// class ApiProvider{
//   final client= Client();
//   Future<List<ItemModel>> fetchList(){
//     final response= client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     if(response.hashCode==200){
//       final List<dynamic> jsonList=json.decode(utf8.decode(response.bodyBytes));
//       final List<ItemModel> listItem=jsonList.map((json) => ItemModel.fromJson(json)).toList();
//       return listItem;
//     }
//     else {
//       throw Exception('Failed to load post');
//           }
//   }
// }