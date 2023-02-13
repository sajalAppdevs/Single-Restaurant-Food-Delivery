import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/globals.dart';
import 'package:food_delivery_single_template/locator.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/service/service.dart';

class FoodMenuItemsCubit extends Cubit<PlacesState> {
  final Service service = getIt<Service>();

  FoodMenuItemsCubit() : super(const InitialPlacesState());

  void getFoodMenuItems(
    String? categoryId,
    String? keyword,
    bool onlyFavorites,
    bool onlyFeatured,
    bool onlyPopular,
    bool onlySale,
  ) async {
    final places = await service.getFoodMenuItems(
      Globals.loggedCustomerId,
      categoryId: categoryId,
      keyword: keyword,
      onlyFavorites: onlyFavorites,
      onlyFeatured: onlyFeatured,
      onlyPopular: onlyPopular,
      onlySale: onlySale,
    );

    emit(LoadedPlacesState(places.toList()));
  }
}

@immutable
abstract class PlacesState extends Equatable {
  const PlacesState();
}

class InitialPlacesState extends PlacesState {
  const InitialPlacesState();

  @override
  List<Object?> get props => [];
}

class LoadedPlacesState extends PlacesState {
  final List<FoodMenuItem> menuItems;

  const LoadedPlacesState(this.menuItems);

  @override
  List<Object?> get props => [menuItems];
}
