import 'package:flutter/material.dart';
import 'package:flutter_spectrum/enums/order_status_item_view.dart';
import 'package:collection/collection.dart';

class Enums extends StatefulWidget {
  const Enums({Key? key}) : super(key: key);

  @override
  State<Enums> createState() => _EnumsState();
}

class _EnumsState extends State<Enums> {
  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeColors.background,
      appBar: AppBar(
        elevation: 0,
        title: const Column(
          children: [
            Text('Order tracking'),
            Text(
              '#ORDER123',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 48,
          bottom: 16,
        ),
        children: const [
          OrderStatusItemView(
            color: Colors.amber,
            title: 'Processing',
            subtitle: 'Your order is being processed.',
            icon: Icons.hourglass_top_outlined,
            showLine: true,
            isActive: true,
          ),
          OrderStatusItemView(
            color: Colors.blue,
            title: 'In Transit',
            subtitle: 'Your order is on it\'s way to you.',
            icon: Icons.local_shipping_outlined,
            showLine: true,
            isActive: true,
          ),
          OrderStatusItemView(
            color: Colors.green,
            title: 'Delivered',
            subtitle: 'Thank you for shopping with us.',
            icon: Icons.task_alt_outlined,
            showLine: false,
            isActive: false,
          ),
        ],
      ),
    );
  }
}
