// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ShoppingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShoppingPage(),
      );
    },
    ShoppingChartsRoute.name: (routeData) {
      final args = routeData.argsAs<ShoppingChartsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShoppingChartsPage(
          key: args.key,
          shoppingViewModel: args.shoppingViewModel,
        ),
      );
    },
    AddShoppingItemRoute.name: (routeData) {
      final args = routeData.argsAs<AddShoppingItemRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddShoppingItemPage(
          key: args.key,
          viewModel: args.viewModel,
        ),
      );
    },
  };
}

/// generated route for
/// [ShoppingPage]
class ShoppingRoute extends PageRouteInfo<void> {
  const ShoppingRoute({List<PageRouteInfo>? children})
      : super(
          ShoppingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShoppingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShoppingChartsPage]
class ShoppingChartsRoute extends PageRouteInfo<ShoppingChartsRouteArgs> {
  ShoppingChartsRoute({
    Key? key,
    required ShoppingViewModel shoppingViewModel,
    List<PageRouteInfo>? children,
  }) : super(
          ShoppingChartsRoute.name,
          args: ShoppingChartsRouteArgs(
            key: key,
            shoppingViewModel: shoppingViewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ShoppingChartsRoute';

  static const PageInfo<ShoppingChartsRouteArgs> page =
      PageInfo<ShoppingChartsRouteArgs>(name);
}

class ShoppingChartsRouteArgs {
  const ShoppingChartsRouteArgs({
    this.key,
    required this.shoppingViewModel,
  });

  final Key? key;

  final ShoppingViewModel shoppingViewModel;

  @override
  String toString() {
    return 'ShoppingChartsRouteArgs{key: $key, shoppingViewModel: $shoppingViewModel}';
  }
}

/// generated route for
/// [AddShoppingItemPage]
class AddShoppingItemRoute extends PageRouteInfo<AddShoppingItemRouteArgs> {
  AddShoppingItemRoute({
    Key? key,
    required ShoppingViewModel viewModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddShoppingItemRoute.name,
          args: AddShoppingItemRouteArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddShoppingItemRoute';

  static const PageInfo<AddShoppingItemRouteArgs> page =
      PageInfo<AddShoppingItemRouteArgs>(name);
}

class AddShoppingItemRouteArgs {
  const AddShoppingItemRouteArgs({
    this.key,
    required this.viewModel,
  });

  final Key? key;

  final ShoppingViewModel viewModel;

  @override
  String toString() {
    return 'AddShoppingItemRouteArgs{key: $key, viewModel: $viewModel}';
  }
}
