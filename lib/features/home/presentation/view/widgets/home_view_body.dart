import 'package:flutter/material.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/custom_shape.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/custom_form.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomShape(),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffec8b24),
                  borderRadius: BorderRadius.circular(12)),
              child: const CustomForm(),
            )
          ],
        ),
      ),
    );
  }
}
