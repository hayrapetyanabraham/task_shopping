import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/core/repository/shopping_repository.dart';

class UpdateItemsUseCase {
  final ShoppingRepository _repository;

  UpdateItemsUseCase(this._repository);

  Future<void> execute(ShoppingItem item) async {
    return _repository.updateShoppingItem(item);
  }
}
