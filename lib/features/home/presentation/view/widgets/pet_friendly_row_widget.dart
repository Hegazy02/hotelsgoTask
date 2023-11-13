import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/container_with_shadow.dart';

class PetFriendlyRowWidget extends StatelessWidget {
  final bool petFriendly;
  final void Function(bool)? onChanged;
  const PetFriendlyRowWidget(
      {super.key, required this.petFriendly, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ContainerWithShadow(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Pet-friendly ",
                  style: Styles.style14Black,
                ),
                const Icon(Icons.info_outline)
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Only shows stays that allow pets",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        CupertinoSwitch(value: petFriendly, onChanged: onChanged)
      ],
    ));
  }
}
