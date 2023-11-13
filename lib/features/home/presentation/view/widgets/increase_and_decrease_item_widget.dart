import 'package:flutter/widgets.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/increase_or_derease_button.dart';

class IncreaseAndDecreaseItemWidget extends StatelessWidget {
  final void Function()? onIncreaseTap;
  final void Function()? onDecreaseTap;
  final int itemNumber;
  final String itemTitle;
  final bool limit;

  const IncreaseAndDecreaseItemWidget(
      {super.key,
      required this.onIncreaseTap,
      required this.onDecreaseTap,
      required this.itemTitle,
      required this.itemNumber,
      required this.limit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(itemTitle),
        const Spacer(),
        IncreaseOrDereaseButton(
            increase: false, onTap: onDecreaseTap, limit: limit),
        const SizedBox(
          width: 20,
        ),
        Text("$itemNumber"),
        const SizedBox(
          width: 20,
        ),
        IncreaseOrDereaseButton(
            increase: true, onTap: onIncreaseTap, limit: false),
      ],
    );
  }
}
