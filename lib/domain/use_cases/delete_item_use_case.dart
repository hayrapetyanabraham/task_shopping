import 'package:task_shopping/core/repository/shopping_repository.dart';

class DeleteItemUseCase {
  final ShoppingRepository _repository;

  DeleteItemUseCase(this._repository);

  Future<void> execute(int id) async {
    await _repository.deleteShoppingItem(id);
  }
}
