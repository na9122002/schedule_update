import 'package:flutter/material.dart';
import 'package:wrok_app_1/models/item_api_model.dart';
import 'package:wrok_app_1/api/resources/api_provider.dart';

class Respository {
  Future<List<ItemModel>> fetchAll() => ApiProvider().fetchList();
}
