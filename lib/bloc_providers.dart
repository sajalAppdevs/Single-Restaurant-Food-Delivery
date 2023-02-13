import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/cubit/basket_cubit.dart';
import 'package:food_delivery_single_template/cubit/favorite_cubit.dart';
import 'package:food_delivery_single_template/cubit/food_menu_items_cubit.dart';
import 'package:food_delivery_single_template/cubit/home_cubit.dart';
import 'package:food_delivery_single_template/cubit/my_account_cubit.dart';

class BlocProviders {
  BlocProviders._();

  static get getProviders => [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => MyAccountCubit()),
        BlocProvider(create: (_) => FoodMenuItemsCubit()),
        BlocProvider(create: (_) => BasketCubit()..getBasketItems()),
        BlocProvider(create: (_) => FavoriteCubit()..getFavorites()),
      ];
}
