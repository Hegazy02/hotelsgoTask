import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/button_with_background.dart';

class SelectRoomTypeAndGuests extends StatefulWidget {
  final void Function()? onTap;
  final int roomsNumber;
  final int adultsNumber;
  final int childrenNumber;

  const SelectRoomTypeAndGuests({
    super.key,
    required this.onTap,
    required this.roomsNumber,
    required this.adultsNumber,
    required this.childrenNumber,
  });

  @override
  State<SelectRoomTypeAndGuests> createState() =>
      _SelectRoomTypeAndGuestsState();
}

class _SelectRoomTypeAndGuestsState extends State<SelectRoomTypeAndGuests> {
  @override
  Widget build(BuildContext context) {
    return ButtonWithBackground(
        child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${widget.roomsNumber} Room, ${widget.adultsNumber} Adult, ${widget.childrenNumber} Children",
                    style: Styles.style12,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )));
  }
}
