import 'package:food_delivery_single_template/datastore/data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/address_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/basket_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/category_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/customer_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/favorite_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/food_menu_item_data_store.dart';
import 'package:food_delivery_single_template/datastore/mock/poster_data_store.dart';
import 'package:food_delivery_single_template/locator.dart';
import 'package:food_delivery_single_template/model/address.dart';
import 'package:food_delivery_single_template/model/basket_item.dart';
import 'package:food_delivery_single_template/model/category.dart';
import 'package:food_delivery_single_template/model/customer.dart';
import 'package:food_delivery_single_template/model/favorite.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/model/poster.dart';
import 'package:uuid/uuid.dart';

//Mock service that works with mock data stores for testing.
class Service {
  DataStore<Address> dataAddress = getIt<AddressDataStore>();
  DataStore<BasketItem> dataBasket = getIt<BasketDataStore>();
  DataStore<Category> dataCuisine = getIt<CategoryDataStore>();
  DataStore<Customer> dataCustomer = getIt<CustomerDataStore>();
  DataStore<Favorite> dataFavorite = getIt<FavoriteDataStore>();
  DataStore<FoodMenuItem> dataFoodMenuItem = getIt<FoodMenuItemDataStore>();
  DataStore<Poster> dataPoster = getIt<PosterDataStore>();

  // Methods for Poster entity

  Future<List<Poster>> getPosters() async {
    return await dataPoster.getAll();
  }

  // Methods for Category entity

  Future<List<Category>> getCategories({String? name}) async {
    final result = await dataCuisine.getBy((i) =>
        name == null || i.name.toLowerCase().contains(name.toLowerCase()));
    final categories = result.toList();
    categories.sort((a, b) => a.name.compareTo(b.name));
    return categories;
  }

  // Methods for food menu item entity

  Future<FoodMenuItem> getFoodMenuItem(String customerId, String id) async {
    final item = await dataFoodMenuItem.get(id);

    bool isFavorite = await dataFavorite
        .isExist((f) => f.customerId == customerId && f.itemId == item.id);

    return item.copyWith(isFavorite: isFavorite);
  }

  Future<List<FoodMenuItem>> getFoodMenuItems(String customerId,
      {String? categoryId,
      String? keyword,
      bool onlyFavorites = false,
      bool onlyFeatured = false,
      bool onlyPopular = false,
      bool onlySale = false}) async {
    List<FoodMenuItem> menuItems = [];

    final result = (await dataFoodMenuItem.getBy((i) =>
        (categoryId == null || i.categoryId == categoryId) &&
        (keyword == null ||
            i.name.toLowerCase().contains(keyword.toLowerCase())) &&
        (onlyFeatured == false || i.isFeatured) &&
        (onlyPopular == false || i.isPopular) &&
        (onlySale == false || i.onSale)));

    for (var item in result) {
      bool isFavorite = false;

      isFavorite = await dataFavorite
          .isExist((f) => f.customerId == customerId && f.itemId == item.id);

      final menuItem = item.copyWith(isFavorite: isFavorite);

      menuItems.add(menuItem);
    }

    menuItems =
        menuItems.where((p) => onlyFavorites == false || p.isFavorite).toList();

    menuItems.sort((a, b) => a.name.compareTo(b.name));

    return menuItems;
  }

  // Methods for Customer entity

  Future<Customer> getCustomer(String id) async {
    return await dataCustomer.get(id);
  }

  Future<bool> updateCustomer(
    String id,
    String fullName,
    String username,
    String email, {
    String image = "no_image",
    String phone = "",
  }) async {
    final customer = Customer(
        id: id,
        fullName: fullName,
        username: username,
        email: email,
        image: image);

    return await dataCustomer.update(customer);
  }

  // Methods for BasketItem entity

  Future<BasketItem> getBasketItem(String id) async {
    return await dataBasket.get(id);
  }

  Future<BasketItem> addBasketItem(
    String productName,
    String productImage,
    double unitPrice,
    int quantity, {
    String? ingredients,
    String? extrasAndOptions,
  }) async {
    final result = await dataBasket.getBy((i) =>
        i.productName == productName &&
        i.unitPrice == unitPrice &&
        (ingredients == null || i.ingredients == ingredients) &&
        (extrasAndOptions == null || i.extrasAndOptions == extrasAndOptions));

    if (result.isEmpty) {
      final newItem = BasketItem(
        id: const Uuid().v4(),
        productName: productName,
        productImage: productImage,
        unitPrice: unitPrice,
        quantity: quantity,
        dateGmt: DateTime.now().toUtc(),
        ingredients: ingredients ?? "",
        extrasAndOptions: extrasAndOptions ?? "",
      );

      return await dataBasket.add(newItem);
    } else {
      final oldItem = result.first;
      final newItem = oldItem.copyWith(quantity: quantity + oldItem.quantity);
      await dataBasket.update(newItem);
      return newItem;
    }
  }

  Future<bool> updateBasketItem(String id, int quantity) async {
    final oldItem = await dataBasket.get(id);
    final newItem = oldItem.copyWith(quantity: quantity);

    return await dataBasket.update(newItem);
  }

  Future<List<BasketItem>> getBasketItems() async {
    final results = await dataBasket.getAll();

    results.sort((a, b) => a.dateGmt.compareTo(b.dateGmt));

    return results;
  }

  Future<bool> deleteBasketItem(String id) async {
    return await dataBasket.delete(id);
  }

  Future<bool> deleteAllBasketItems() async {
    return await dataBasket.deleteAll();
  }

  // Methods for Favorite entity

  Future<Favorite?> getFavorite(String customerId, String itemId) async {
    final favorites = await dataFavorite
        .getBy((f) => f.customerId == customerId && f.itemId == itemId);
    return favorites.isNotEmpty ? favorites.first : null;
  }

  Future<List<Favorite>> getFavorites(String customerId) async {
    final favorites =
        await dataFavorite.getBy((f) => f.customerId == customerId);
    return favorites.toList();
  }

  Future<Favorite> addFavorite(String customerId, String itemId) async {
    final favorite = Favorite(
      id: const Uuid().v4(),
      customerId: customerId,
      itemId: itemId,
    );

    return await dataFavorite.add(favorite);
  }

  Future<bool> deleteFavorite(String id) async {
    return await dataFavorite.delete(id);
  }

}
