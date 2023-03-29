import 'package:task_shopping/core/repository/shopping_repository.dart';
import 'package:task_shopping/data/local/shopping_database.dart';
import 'package:task_shopping/data/models/shopping_item.dart';

class ShoppingRepositoryImpl implements ShoppingRepository {
  final ShoppingDatabase _shoppingDatabase;

  ShoppingRepositoryImpl(this._shoppingDatabase);

  @override
  Future<List<ShoppingItem>> getShoppingItems() async {
    return await _shoppingDatabase.getAllItems();
  }

  @override
  Future<int> addShoppingItem(ShoppingItem item) async {
    return await _shoppingDatabase.insert(item);
  }

  @override
  Future<void> updateShoppingItem(ShoppingItem item) async {
    return await _shoppingDatabase.update(item);
  }

  @override
  Future<void> deleteShoppingItem(int id) async {
    return await _shoppingDatabase.delete(id);
  }

  @override
  Future<void> deleteAllShoppingItems() async {
    return await _shoppingDatabase.deleteAllItems();
  }
}