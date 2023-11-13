import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/triangle_painter.dart';
import 'package:sizer/sizer.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 30.w,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xff196cba),
          ),
          child: Center(
            child: Text(
              "Hotels Search",
              style: Styles.style12WhiteBold,
            ),
          ),
        ),
        CustomPaint(
          painter: TrianglePainter(
            strokeColor: const Color(0xff196cba),
            strokeWidth: 10,
            paintingStyle: PaintingStyle.fill,
          ),
          child: SizedBox(
            height: 50,
            width: 15.w,
          ),
        ),
      ],
    );
  }
}
