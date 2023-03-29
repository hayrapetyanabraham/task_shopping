import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/core/repository/shopping_repository.dart';

class GetAllItemsUseCase {
  final ShoppingRepository _repository;

  GetAllItemsUseCase(this._repository);

  Future<List<ShoppingItem>> execute() async {
    return _repository.getShoppingItems();
  }
}