import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/button_with_background.dart';

class SelectNationalityDropDown extends StatelessWidget {
  final void Function(dynamic)? onChanged;
  final String selectedValue;
  const SelectNationalityDropDown(
      {super.key, required this.onChanged, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return ButtonWithBackground(
      child: DropdownButtonFormField(
          dropdownColor: Colors.white,
          value: selectedValue,
          items: dropdownMenuItems
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: Styles.style14,
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: (value) =>
              value == 'Select Nationality' ? "Select your nationality" : null,
          padding: const EdgeInsets.only(left: 10),
          decoration: InputDecoration(
            focusedBorder: borderDecoration(),
            enabledBorder: borderDecoration(),
            errorBorder: borderDecoration(),
            focusedErrorBorder: borderDecoration(),
          )),
    );
  }
}

UnderlineInputBorder borderDecoration() =>
    const UnderlineInputBorder(borderSide: BorderSide.none);

List<String> dropdownMenuItems = [
  "Select Nationality",
  "Egyptian",
  "Britch",
  "American",
];
