import 'package:flutter/material.dart';
import 'package:flutter_spectrum/utils/utilities.dart';

class OrderStatusItemView extends StatelessWidget {
  const OrderStatusItemView(
      {Key? key,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.showLine,
      required this.isActive})
      : super(key: key);
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool showLine;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return Opacity(
      opacity: isActive ? 1 : 0.3,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: color,
                      border: Border.all(
                        color: isActive ? color : Colors.grey,
                      ),
                    ),
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? color : Colors.grey,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: showLine,
                    child: Expanded(
                      child: CustomPaint(
                        painter: DashedLinePainter(
                            color: isActive ? color : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                color: themeColors.surface,
                child: ListTile(
                  title: Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  trailing: Icon(
                    icon,
                    color: isActive ? color : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
