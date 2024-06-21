import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation(
      {super.key, required this.child, this.milliseconds = 300});

  final Widget child;
  final int milliseconds;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: milliseconds + 700),
        curve: Curves.ease,
        onEnd: () {
          HapticFeedback.lightImpact();
        },
        builder: (context, value, _) {
          return Transform.translate(
            offset: Offset(0, lerpDouble(500, 0, value)!),
            child: child,
          );
        });
  }
}
