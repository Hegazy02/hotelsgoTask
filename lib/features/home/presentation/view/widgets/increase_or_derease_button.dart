import 'package:flutter/material.dart';

class IncreaseOrDereaseButton extends StatelessWidget {
  final bool increase;
  final void Function()? onTap;
  final bool limit;
  const IncreaseOrDereaseButton(
      {super.key,
      required this.increase,
      required this.onTap,
      required this.limit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: limit ? () {} : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: limit
                  ? const Color(0xff75b2c0).withOpacity(0.3)
                  : const Color(0xff75b2c0)),
        ),
        child: Icon(
          increase ? Icons.add : Icons.remove,
          color: limit
              ? const Color(0xff75b2c0).withOpacity(0.3)
              : const Color(0xff75b2c0),
        ),
      ),
    );
  }
}
