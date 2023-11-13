import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonWithBackground extends StatelessWidget {
  final Widget child;
  const ButtonWithBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
