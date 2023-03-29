import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task_shopping/core/navigation/app_router.dart';
import 'package:task_shopping/core/repository/shopping_repository.dart';
import 'package:task_shopping/core/repository/shopping_repository_impl.dart';
import 'package:task_shopping/core/theme/app_theme.dart';
import 'package:task_shopping/data/local/shopping_database.dart';
import 'package:task_shopping/domain/use_cases/add_item_use_case.dart';
import 'package:task_shopping/domain/use_cases/deleteI_all_use_case.dart';
import 'package:task_shopping/domain/use_cases/delete_item_use_case.dart';
import 'package:task_shopping/domain/use_cases/get_all_items_use_case.dart';
import 'package:task_shopping/domain/use_cases/update_item_use_case.dart';
import 'package:task_shopping/presentation/view_models/shopping_view_model.dart';

GetIt getIt = GetIt.instance;

void main() {
  registerAppDependencies();
  runApp(const MyApp());
}

void registerAppDependencies() {
  getIt
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerFactory<ShoppingDatabase>(() => ShoppingDatabase.instance)
    ..registerFactory<ShoppingRepository>(
        () => ShoppingRepositoryImpl(getIt<ShoppingDatabase>()))
    ..registerFactory<ShoppingRepositoryImpl>(
        () => ShoppingRepositoryImpl(getIt<ShoppingDatabase>()))
    ..registerFactory<GetAllItemsUseCase>(
        () => GetAllItemsUseCase(getIt<ShoppingRepository>()))
    ..registerFactory<AddItemUseCase>(
        () => AddItemUseCase(getIt<ShoppingRepository>()))
    ..registerFactory<UpdateItemsUseCase>(
        () => UpdateItemsUseCase(getIt<ShoppingRepository>()))
    ..registerFactory<DeleteItemUseCase>(
        () => DeleteItemUseCase(getIt<ShoppingRepository>()))
    ..registerFactory<DeleteAllUseCase>(
        () => DeleteAllUseCase(getIt<ShoppingRepository>()))
    ..registerFactory<ShoppingViewModel>(() => ShoppingViewModel(
          addItemUseCase: getIt<AddItemUseCase>(),
          getAllItemsUseCase: getIt<GetAllItemsUseCase>(),
          updateItemsUseCase: getIt<UpdateItemsUseCase>(),
          deleteItemUseCase: getIt<DeleteItemUseCase>(),
          deleteAllUseCase: getIt<DeleteAllUseCase>(),
          currentShoppingItems: [],
        ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ShoppingViewModel>()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.getTheme(),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
