import 'package:task_shopping/data/models/shopping_item.dart';

abstract class ShoppingRepository {
  Future<List<ShoppingItem>> getShoppingItems();

  Future<int> addShoppingItem(ShoppingItem item);

  Future<void> updateShoppingItem(ShoppingItem item);

  Future<void> deleteShoppingItem(int id);

  Future<void> deleteAllShoppingItems();
}
