// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Order(OrderStatusEnhanced.delivered, 'orderId');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: ColoredBox(
          color: order.orderStatus.color,
          child: Text(
            '${order.orderStatus.title}\n${order.orderStatus.description}',
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}

enum OrderStatusEnhanced {
  processing(
    color: Colors.amber,
    title: 'Processing',
    icon: Icons.hourglass_top_outlined,
    description: 'Your order is being processed',
  ),
  inTransit(
    color: Colors.blue,
    title: 'In Transit',
    icon: Icons.local_shipping_outlined,
    description: 'Your order is in transit',
  ),
  delivered(
    color: Colors.green,
    title: 'Delivered',
    icon: Icons.task_alt_outlined,
    description: 'Thank you for shopping with us',
  );

  final Color color;
  final String title;
  final IconData icon;
  final String description;

  const OrderStatusEnhanced({
    required this.color,
    required this.title,
    required this.icon,
    required this.description,
  });
}

enum OrderStatus {
  processing,
  inTransit,
  delivered;

  String get humanReadable {
    switch (this) {
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  String get statusDescpription {
    switch (this) {
      case OrderStatus.processing:
        return 'Your order is being processed';
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.processing:
        return Colors.amber;
      case OrderStatus.inTransit:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
    }
  }
}

class Order {
  final OrderStatusEnhanced orderStatus;
  final String orderId;

  Order(this.orderStatus, this.orderId);

  @override
  String toString() => 'Order(orderStatus: $orderStatus, orderId: $orderId)';
}
