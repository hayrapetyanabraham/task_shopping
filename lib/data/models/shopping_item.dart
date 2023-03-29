class ShoppingItem {
  static const tableName = 'shopping_items';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPurchaseTime = 'purchase_time';
  static const columnPrice = 'price';
  static const columnQuantity = 'quantity';
  static const columnWarrantyPeriod = 'warranty_period';

  final int id;
  final String name;
  final DateTime purchaseTime;
  final double price;
  final int quantity;
  final DateTime warrantyPeriod;

  ShoppingItem({
    required this.id,
    required this.name,
    required this.purchaseTime,
    required this.price,
    required this.quantity,
    required this.warrantyPeriod,
  });

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: name,
      columnPurchaseTime: purchaseTime.toIso8601String(),
      columnPrice: price,
      columnQuantity: quantity,
      columnWarrantyPeriod: warrantyPeriod.toIso8601String(),
    };
  }

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map[columnId],
      name: map[columnName],
      purchaseTime: DateTime.parse(map[columnPurchaseTime]),
      price: map[columnPrice],
      quantity: map[columnQuantity],
      warrantyPeriod: DateTime.parse(map[columnWarrantyPeriod]),
    );
  }
}
