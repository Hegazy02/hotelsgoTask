import 'package:flutter/material.dart';

class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  const ContainerWithShadow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 1.5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: child,
      ),
    );
  }
}
