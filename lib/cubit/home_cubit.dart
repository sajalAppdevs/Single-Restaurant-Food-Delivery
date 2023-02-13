import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/globals.dart';
import 'package:food_delivery_single_template/locator.dart';
import 'package:food_delivery_single_template/model/category.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/model/poster.dart';
import 'package:food_delivery_single_template/service/service.dart';

class HomeCubit extends Cubit<HomeState> {
  final Service service = getIt<Service>();

  HomeCubit() : super(const InitialHomeState());

  void load() async {
    final posters = await service.getPosters();
    final categories = await service.getCategories();
    final featuredItems = await service
        .getFoodMenuItems(Globals.loggedCustomerId, onlyFeatured: true);
    final popularItems =
        await service.getFoodMenuItems(Globals.loggedCustomerId, onlyPopular: true);
    final favoriteItems =
        await service.getFoodMenuItems(Globals.loggedCustomerId, onlyFavorites: true);

    emit(LoadedHomeState(
      posters.toList(),
      categories.toList(),
      featuredItems.toList(),
      popularItems.toList(),
      favoriteItems.toList(),
    ));
  }
}

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  const InitialHomeState();

  @override
  List<Object?> get props => [];
}

class LoadedHomeState extends HomeState {
  final List<Poster> posters;
  final List<Category> categories;
  final List<FoodMenuItem> featuredItems;
  final List<FoodMenuItem> popularItems;
  final List<FoodMenuItem> favoriteItems;

  const LoadedHomeState(
    this.posters,
    this.categories,
    this.featuredItems,
    this.popularItems,
    this.favoriteItems,
  );

  @override
  List<Object?> get props => [
        posters,
        categories,
        featuredItems,
        popularItems,
        favoriteItems,
      ];
}
