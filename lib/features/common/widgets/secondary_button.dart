import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
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
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
        ));
  }
}
