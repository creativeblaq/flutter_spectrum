import 'package:flutter/material.dart';
import 'package:flutter_spectrum/enums/enums.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final themeColors = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Order Details'),
            Text(
              '#${MyOrder.order.orderId}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //*===== Delivery details Header ===== */
              SectionHeading(
                text: 'Delivery details',
                showChip: true,
                chipText: MyOrder.order.status.humanReadableName,
                chipColor: MyOrder.order.status.color.withOpacity(0.2),
                chipTextColor: MyOrder.order.status.color,
              ),
              const SizedBox(
                height: 8,
              ),
              //*===== Delivery address ===== */
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: themeColors.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '123 Main St,\nNew York, NY\n10001',
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              //*===== Order Summary ===== */
              const SectionHeading(text: 'Order summary'),
              const SizedBox(
                height: 8,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: themeColors.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: Text(
                        'Tropical Pizza',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    const Divider(),
                    //Ingredients list for pizza
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tomato,\nCheese, \nHam, \nPineapple',
                            style: TextStyle(
                              color: themeColors.outline,
                            ),
                          ),
                          Text(
                            'R154.90',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: themeColors.outline,
                            ),
                          )
                        ],
                      ),
                    ),

                    const Divider(),

                    //Total
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2x',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'R309.80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //*===== Payment details ===== */
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: themeColors.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                          ),
                          Text(
                            'R309.80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Delivery fee
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery fee',
                          ),
                          Text(
                            'R20.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    //Total
                    Padding(
                      padding: EdgeInsets.only(bottom: 12, left: 12, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            'R329.80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.text,
    this.showChip = false,
    this.chipText,
    this.chipColor,
    this.chipTextColor,
  });

  final String text;
  final bool showChip;
  final String? chipText;
  final Color? chipColor;
  final Color? chipTextColor;

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Visibility(
          visible: showChip,
          child: Card(
            color: chipColor ?? themeColors.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: chipTextColor ?? themeColors.onPrimary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                chipText ?? '',
                style: TextStyle(
                  color: chipTextColor ?? themeColors.onPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
