import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/domain/use_cases/add_item_use_case.dart';
import 'package:task_shopping/domain/use_cases/deleteI_all_use_case.dart';
import 'package:task_shopping/domain/use_cases/delete_item_use_case.dart';
import 'package:task_shopping/domain/use_cases/get_all_items_use_case.dart';
import 'package:task_shopping/domain/use_cases/update_item_use_case.dart';
import 'package:task_shopping/presentation/state/shopping_initial_state.dart';
import 'package:task_shopping/presentation/state/shopping_state.dart';

class ShoppingViewModel extends Cubit<ShoppingState> {
  final AddItemUseCase addItemUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  final GetAllItemsUseCase getAllItemsUseCase;
  final UpdateItemsUseCase updateItemsUseCase;
  final DeleteAllUseCase deleteAllUseCase;
  List<ShoppingItem> currentShoppingItems;

  ShoppingViewModel({
    required this.addItemUseCase,
    required this.getAllItemsUseCase,
    required this.updateItemsUseCase,
    required this.deleteItemUseCase,
    required this.deleteAllUseCase,
    required this.currentShoppingItems,
  }) : super(ShoppingInitialState());

  Future<void> getShoppingItems() async {
    try {
      emit(ShoppingLoading());
      currentShoppingItems = await getAllItemsUseCase.execute();
      emit(ShoppingLoaded(currentShoppingItems));
    } catch (e) {
      emit(ShoppingError(e.toString()));
    }
  }

  Future<void> addShoppingItem(ShoppingItem item) async {
    try {
      emit(ShoppingLoading());
      await addItemUseCase.execute(item);
      currentShoppingItems.add(item);
      emit(ShoppingLoaded(currentShoppingItems));
    } catch (e) {
      emit(ShoppingError(e.toString()));
    }
  }

  void filterItems(String query) {
    final filteredItems = currentShoppingItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(ShoppingLoaded(filteredItems));
  }

  Future<void> updateShoppingItem(ShoppingItem item) async {
    try {
      emit(ShoppingLoading());
      await updateItemsUseCase.execute(item);
      final currentState = state;
      if (currentState is ShoppingLoaded) {
        currentShoppingItems =
            currentState.items.map((e) => e.id == item.id ? item : e).toList();
        emit(ShoppingLoaded(currentShoppingItems));
      }
    } catch (e) {
      emit(ShoppingError(e.toString()));
    }
  }

  Future<void> deleteShoppingItem(int id) async {
    try {
      emit(ShoppingLoading());
      await deleteItemUseCase.execute(id);
      currentShoppingItems.removeWhere((item) => item.id == id);
      emit(ShoppingLoaded(currentShoppingItems));
    } catch (e) {
      emit(ShoppingError(e.toString()));
    }
  }

  Future<void> deleteAllShoppingItems() async {
    try {
      emit(ShoppingLoading());
      await deleteAllUseCase.execute();
      emit(ShoppingLoaded([]));
    } catch (e) {
      emit(ShoppingError(e.toString()));
    }
  }
}
