import 'package:flutter/material.dart';
import 'package:flutter_spectrum/extensions/buildctx_ex.dart';
import 'package:flutter_spectrum/extensions/color_ex.dart';
import 'package:flutter_spectrum/extensions/date_ex.dart';
import 'package:flutter_spectrum/extensions/num_widget_ex.dart';
import 'package:flutter_spectrum/extensions/textwidget_ex.dart';
import 'package:flutter_spectrum/extensions/widget_ex.dart';
import 'package:flutter_spectrum/models/order_model.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);
  static const String routeName = 'order-details';
  static const String routeLocation = '/$routeName';

  @override
  Widget build(BuildContext context) {
    final order = OrderModel.order;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            'Order details'.headLrg,
            "#${order.orderId}".body.color(context.colors.outline),
          ],
        ),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: ListView(
          padding: 16.ph,
          children: [
            Row(
              children: [
                'Delivery details'.headSm,
                24.wBox,
                Card(
                  shape: 50.roundedShape(
                    color: order.status.color.toColor,
                  ),
                  color: order.status.color.toColor.withOpacity(0.3),
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: 50.roudedRadius,
                    child: order.status.title.bodySm
                        .color(
                          order.status.color.toColor,
                        )
                        .alignCenter
                        .pad(4.pv)
                        .pad(8.ph),
                  ),
                ),
              ],
            ),
            16.hBox,
            Card(
              shape: 12.roundedShape(
                color: context.colors.outline,
              ),
              margin: EdgeInsets.zero,
              child: order.address.body.pad(16.pA),
            ),
            24.hBox,
            'Order summary'.headSm,
            16.hBox,
            ...order.items.map((item) {
              return Card(
                shape: 12.roundedShape(
                  color: context.colors.outline,
                ),
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    item.itemName.headLrg.pad(16.ph).pad(12.pt),
                    'Order placed: ${order.updatedAt.formatDateToDDMYTT()}'
                        .bodySm
                        .color(
                          context.colors.outline,
                        )
                        .pad(16.ph),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              item.description.body,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: item.colorCode.toColor,
                                      border: Border.all(
                                        color: context.colors.outline,
                                      ),
                                    ),
                                  ),
                                  8.wBox,
                                  item.color.body
                                ],
                              )
                            ],
                          ),
                        ),
                        item.itemPrice.toMoneyFormat(r"$").headSm,
                      ],
                    ).pad(16.ph),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "${item.itemQuantity}x"
                            .headLrg
                            .weight(FontWeight.normal),
                        item.itemPrice.toMoneyFormat(r"$").headLrg
                      ],
                    ).pad(16.ph).pad(12.pb)
                  ],
                ),
              );
            }),
            16.hBox,
            Card(
              shape: 12.roundedShape(
                color: context.colors.outline,
              ),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  12.hBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Subtotal'.body,
                      order.subTotal.toMoneyFormat(r'$').headSm
                    ],
                  ).pad(16.ph),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Shipping'.body,
                      order.shipping.toMoneyFormat(r'$').headSm
                    ],
                  ).pad(16.ph),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Total'.headLrg,
                      order.total.toMoneyFormat(r'$').headLrg
                    ],
                  ).pad(16.ph).pad(12.pb),
                ],
              ),
            )
          ],
        ).pad(16.pt).pad(90.pb),
      ),
    );
  }
}
