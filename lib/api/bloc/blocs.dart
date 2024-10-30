import 'package:rxdart/rxdart.dart';
import 'package:wrok_app_1/api/resources/respository.dart';
import '../../models/item_api_model.dart';

class Blocs {
  final Fetcher = PublishSubject<List<ItemModel>>();
  Stream<List<ItemModel>> get all => Fetcher.stream;
  fetchAll() async {
    final repository = Respository();
    List<ItemModel> itemModel = await repository.fetchAll();
    Fetcher.sink.add(itemModel);
  }

  dispose() {
    Fetcher.close();
  }
}
