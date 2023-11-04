import 'package:flutter_spectrum/models/order_item.dart';
import 'package:flutter_spectrum/models/order_status_model.dart';

class Order {
  final String orderId;
  final OrderStatus status;
  final DateTime updatedAt;
  final List<OrderItem> items;
  final double subTotal;
  final double shipping;
  final double total;
  final String address;

  Order({
    required this.orderId,
    required this.status,
    required this.updatedAt,
    required this.items,
    required this.subTotal,
    required this.shipping,
    required this.total,
    required this.address,
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
      items: [
        OrderItem(
          itemName: 'iMac 24"',
          itemPrice: 1229,
          itemQuantity: 1,
          description: '24" 4.5K Retina Display\n'
              '256GB SSD Storage\n'
              '8GB unified memory',
          color: 'Blue',
          colorCode: '#26476E',
        )
      ],
      subTotal: 1299,
      shipping: 50,
      total: 1349,
      address: '123 Main St\nJohannesburg, GP\n1001',
    );
  }
}
