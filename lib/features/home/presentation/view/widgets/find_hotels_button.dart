import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FindHotelsButton extends StatelessWidget {
  final void Function()? onTap;
  const FindHotelsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          const Spacer(),
          const Text(
            "find hotels",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search,
            size: 30.sp,
            color: Colors.white,
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
