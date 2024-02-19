import 'package:flutter/material.dart';
import 'package:flutter_spectrum/models/order_model.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);
  static const String routeName = 'order-details';
  static const String routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context) {
    final order = OrderModel.order;
    return Scaffold();
  }
}
