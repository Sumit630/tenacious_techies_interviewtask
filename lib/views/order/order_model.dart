

class OrderResponse {
  final bool success;
  final List<Order> orders;

  OrderResponse({required this.success, required this.orders});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      success: json['success'],
      orders: (json['data']['order_list'] as List)
          .map((order) => Order.fromJson(order))
          .toList(),
    );
  }
}

class Order {
  final String orderId;
  final String posUserName;
  final String orderType;
  final String kotId;
  final String kotStartTime;
  final String kotStatus;
  final List<Item> items;

  Order({
    required this.orderId,
    required this.posUserName,
    required this.orderType,
    required this.kotId,
    required this.kotStartTime,
    required this.kotStatus,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      posUserName: json['pos_user_name'],
      orderType: json['order_type'],
      kotId: json['kot_id'],
      kotStartTime: json['kot_start_time'],
      kotStatus: json['kot_status'],
      items: (json['sectionData'][0]['itemList'] as List)
          .map((item) => Item.fromJson(item))
          .toList(),
    );
  }
}

class Item {
  final String itemName;
  final String categoryName;
  final String itemStatus;
  final String quantity;

  Item({
    required this.itemName,
    required this.categoryName,
    required this.itemStatus,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemName: json['itemName'],
      categoryName: json['category_name'],
      itemStatus: json['item_status'],
      quantity: json['quantity'],
    );
  }
}
