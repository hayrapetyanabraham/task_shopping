import 'package:task_shopping/data/models/shopping_item.dart';

abstract class ShoppingItemDao {
  Future<int> insertShoppingItem(ShoppingItem item);

  Future<int> updateShoppingItem(ShoppingItem item);

  Future<int> deleteShoppingItem(int id);

  Future<List<ShoppingItem>> getShoppingItems();
}
