import 'package:flutter/material.dart';

//* Creating Custom Widgets with Named Constructors
class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const AppText(
    this.text,
    this.style, {
    super.key,
  });

  const AppText.heading(this.text, {super.key})
      : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );
  const AppText.subHeading(this.text, {super.key})
      : style = const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

//* Custom button with named Constructor
class CustomButton extends StatelessWidget {
  final String label;
  final bool isOutlined;

  const CustomButton(this.label, this.isOutlined, {super.key});

  // Named constructor for creating an outlined button
  const CustomButton.outlined(this.label, {super.key}) : isOutlined = true;

  // Named constructor for creating a filled button
  const CustomButton.filled(this.label, {super.key}) : isOutlined = false;

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? OutlinedButton(
            onPressed: () {
              // Handle button click for outlined button
            },
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: () {
              // Handle button click for filled button
            },
            child: Text(label),
          );
  }
}

//.
//.

//* Custom button with Factory Constructor
class CustomFactoryButton extends StatelessWidget {
  final String label;
  final bool isOutlined;

  //Private constructor can only be used in this class
  const CustomFactoryButton._(this.label, this.isOutlined);

  // Factory constructor for creating a custom button
  factory CustomFactoryButton.outlined(String label) {
    return CustomFactoryButton._(label, true);
  }

  // Factory constructor for creating a filled button
  factory CustomFactoryButton.filled(String label) {
    return CustomFactoryButton._(label, false);
  }

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? OutlinedButton(
            onPressed: () {
              // Handle button click for outlined button
            },
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: () {
              // Handle button click for filled button
            },
            child: Text(label),
          );
  }
}
