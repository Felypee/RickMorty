import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.height,
      this.width,
      this.buttonColor,
      this.enabled = true})
      : super(key: key);

  final String title;
  final double? height;

  final double? width;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: width ?? size.width,
        height: height ?? size.height * 0.06,
        child: ElevatedButton(
          style: const ButtonStyle(),
          onPressed: () {
            HapticFeedback.mediumImpact();
            onPressed();
          },
          child: Text(
            title,
          ),
        ));
  }
}
