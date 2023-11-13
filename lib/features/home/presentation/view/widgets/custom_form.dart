import 'package:flutter/material.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/bottom_sheet_screen.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/date_range_picker.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/find_hotels_button.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/select_city_button.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/select_nationality_dropdown.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/select_room_type_and_guests.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  String nationality = "Select Nationality";
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  List<Map<String, int>> roomsData = [
    {"roomNumber": 1, "adultsNumber": 2, "childrenNumber": 0}
  ];
  final GlobalKey<FormState> dropdownFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: dropdownFormKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff1675bf),
                  Color(0xff4db5fd),
                ]),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SelectCityButton(
                  onTap: () {},
                ),
                DateRangeButton(
                  onTap: () async {
                    final DateTimeRange? dateTimeRange =
                        await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                    if (dateTimeRange != null) {
                      setState(() {
                        selectedDates = dateTimeRange;
                      });
                    }
                  },
                  selectedDates: selectedDates,
                  onDeleteDate: () {
                    setState(() {
                      selectedDates = DateTimeRange(
                          start: DateTime.now(), end: DateTime.now());
                    });
                  },
                ),
                SelectNationalityDropDown(
                  onChanged: (value) {
                    setState(() {
                      nationality = value;
                    });
                  },
                  selectedValue: nationality,
                ),
                SelectRoomTypeAndGuests(
                  onTap: () async {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: const Color(0xffebecee),
                      // shape: const RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      // ),
                      builder: (context) => BottomSheetScreen(
                        bottomSheetData: roomsData,
                      ),
                    ).then((value) {
                      setState(() {
                        print("value$value");
                        print("xxbottomSheetData$roomsData");
                        roomsData = value ?? roomsData;
                      });
                    });
                  },
                  roomsNumber: getRoomsNumber(),
                  adultsNumber: getAdultsNumber(),
                  childrenNumber: getChildrenNumber(),
                ),
              ],
            ),
          ),
          FindHotelsButton(
            onTap: () {
              validation();
            },
          )
        ],
      ),
    );
  }

  validation() {
    if (dropdownFormKey.currentState!.validate()) {
      print(
          "Date ${selectedDates.start} - ${selectedDates.end}, Nationality $nationality, Rooms $roomsData");
    } else {}
  }

  getRoomsNumber() {
    return roomsData.length;
  }

  getAdultsNumber() {
    int adultsNumber = 0;

    for (var element in roomsData) {
      adultsNumber = adultsNumber + element['adultsNumber']!;
    }
    return adultsNumber;
  }

  getChildrenNumber() {
    int childrenNumber = 0;

    for (var element in roomsData) {
      childrenNumber = childrenNumber + element['childrenNumber']!;
    }
    return childrenNumber;
  }
}
