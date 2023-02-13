import 'package:food_delivery_single_template/datastore/mock/mock_data_store.dart';
import 'package:food_delivery_single_template/model/favorite.dart';

// Mock data store with fake entities to test.
class FavoriteDataStore extends MockDataStore<Favorite> {
  @override
  List<Favorite> items = [
    const Favorite(id: "fav001", customerId: "cu001", itemId: "i010"),
    const Favorite(id: "fav002", customerId: "cu001", itemId: "i016"),
    const Favorite(id: "fav003", customerId: "cu001", itemId: "i017"),
    const Favorite(id: "fav004", customerId: "cu001", itemId: "i023"),
    const Favorite(id: "fav005", customerId: "cu001", itemId: "i025"),
    const Favorite(id: "fav006", customerId: "cu001", itemId: "i027"),
  ];
}
