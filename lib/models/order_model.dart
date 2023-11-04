class OrderStatus {
  final String title;
  final String color;
  final String description;

  OrderStatus({
    required this.title,
    required this.color,
    required this.description,
  });
}

class Order {
  final String orderId;
  final OrderStatus status;
  final DateTime updatedAt;

  Order({
    required this.orderId,
    required this.status,
    required this.updatedAt,
  });

  static Order get order {
    return Order(
      orderId: 'ORDR123',
      status: OrderStatus(
        title: 'Packaging',
        color: '#3F51B5',
        description: 'Your order is being packaged.',
      ),
      updatedAt: DateTime.now(),
    );
  }
}
