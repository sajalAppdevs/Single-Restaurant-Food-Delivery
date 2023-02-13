import 'package:food_delivery_single_template/datastore/mock/address_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/basket_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/category_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/customer_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/favorite_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/food_menu_item_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/poster_data_store.dart';
import 'package:food_delivery_single_template/service/service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<AddressDataStore>(AddressDataStore());
  getIt.registerSingleton<BasketDataStore>(BasketDataStore());
  getIt.registerSingleton<CategoryDataStore>(CategoryDataStore());
  getIt.registerSingleton<CustomerDataStore>(CustomerDataStore());
  getIt.registerSingleton<FavoriteDataStore>(FavoriteDataStore());
  getIt.registerSingleton<FoodMenuItemDataStore>(FoodMenuItemDataStore());
  getIt.registerSingleton<PosterDataStore>(PosterDataStore());

  getIt.registerFactory(() => Service());
}
