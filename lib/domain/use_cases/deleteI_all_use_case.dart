import 'package:task_shopping/core/repository/shopping_repository.dart';

class DeleteAllUseCase {
  final ShoppingRepository _repository;

  DeleteAllUseCase(this._repository);

  Future<void> execute() async {
    await _repository.deleteAllShoppingItems();
  }
}
