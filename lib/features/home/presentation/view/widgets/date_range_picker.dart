import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/button_with_background.dart';
import 'package:intl/intl.dart';

class DateRangeButton extends StatelessWidget {
  final void Function()? onTap;
  final DateTimeRange selectedDates;
  final void Function()? onDeleteDate;
  const DateRangeButton(
      {super.key,
      required this.onTap,
      required this.selectedDates,
      required this.onDeleteDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ButtonWithBackground(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff344f81))),
        child: Row(
          children: [
            const Spacer(
              flex: 4,
            ),
            Text(
              "${DateFormat("yyyy-MM-dd").format(selectedDates.start)} ==> ${DateFormat("yyyy-MM-dd").format(selectedDates.end)}",
              textAlign: TextAlign.center,
              style: Styles.style14Bold,
            ),
            const Spacer(
              flex: 5,
            ),
            IconButton(onPressed: onDeleteDate, icon: const Icon(Icons.close)),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      )),
    );
  }
}
