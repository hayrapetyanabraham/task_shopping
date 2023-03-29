import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_shopping/presentation/view_models/shopping_view_model.dart';
import 'package:task_shopping/presentation/views/shopping_charts/shopping_charts_page.dart';
import 'package:task_shopping/presentation/views/shopping_item/add_shopping_item_page.dart';
import 'package:task_shopping/presentation/views/shopping/shopping_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: ShoppingRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: AddShoppingItemRoute.page,
    ),
    AutoRoute(
      page: ShoppingChartsRoute.page,
    ),
  ];
}
