import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_single_template/cubit/menu_item_detail_cubit.dart';
import 'package:food_delivery_single_template/model/food_menu_item.dart';
import 'package:food_delivery_single_template/page/home_page.dart';
import 'package:food_delivery_single_template/page/food_menu_item_detail_page.dart';

class HomeTabRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/menuitemdetail":
        return MaterialPageRoute(
          builder: (_) {
            final menuItem = settings.arguments as FoodMenuItem;
            return BlocProvider(
              create: (_) => MenuItemDetailCubit(menuItem),
              child: FoodMenuItemDetailPage(choices: menuItem.choices),
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
