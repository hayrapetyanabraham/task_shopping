import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/core/repository/shopping_repository.dart';

class AddItemUseCase {
  final ShoppingRepository _repository;

  AddItemUseCase(this._repository);

  Future<void> execute(ShoppingItem item) async {
    await _repository.addShoppingItem(item);
  }
}
