import 'package:food_delivery_single_template/datastore/mock/mock_data_store.dart';
import 'package:food_delivery_single_template/model/category.dart';

//Mock data store with fake entities to test.
class CategoryDataStore extends MockDataStore<Category> {
  @override
  List<Category> items = const [
    Category(id: "c001", name: "Menu", image: "cat_menu"),
    Category(id: "c002", name: "Burger", image: "cat_burger"),
    Category(id: "c003", name: "Meat", image: "cat_meat"),
    Category(id: "c004", name: "Chicken", image: "cat_chicken"),
    Category(id: "c005", name: "Pasta", image: "cat_pasta"),
    Category(id: "c006", name: "Salad", image: "cat_salad"),
    Category(id: "c007", name: "Dessert", image: "mi_supangle"),
    Category(id: "c008", name: "Beverage", image: "mi_cappucino"),
  ];
}
