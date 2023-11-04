import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);
  static const String routeName = 'order-details';
  static const String routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
      ),
      body: Container(),
    );
  }
}
