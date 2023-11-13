import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/button_with_background.dart';

class SelectCityButton extends StatelessWidget {
  final void Function()? onTap;
  const SelectCityButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ButtonWithBackground(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xffc6e0ef))),
        child: Text(
          "Select city",
          textAlign: TextAlign.center,
          style: Styles.style14,
        ),
      )),
    );
  }
}
