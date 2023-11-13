import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelsgotask/constants/styles.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/age_of_child_num_row_list.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/container_with_shadow.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/increase_and_decrease_item_widget.dart';
import 'package:hotelsgotask/features/home/presentation/view/widgets/pet_friendly_row_widget.dart';
import 'package:sizer/sizer.dart';

class BottomSheetScreen extends StatefulWidget {
  final List<Map<String, int>> bottomSheetData;
  const BottomSheetScreen({super.key, required this.bottomSheetData});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  late List<Map<String, int>> rooms;

  bool petFriendly = false;
  @override
  void initState() {
    rooms = widget.bottomSheetData;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Rooms and Guests",
          style: Styles.style12BlackBold,
        ),
        automaticallyImplyLeading: false,
        trailing: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.close,
              size: 18.sp,
            )),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(children: [
                    ContainerWithShadow(
                        child: IncreaseAndDecreaseItemWidget(
                      onIncreaseTap: () => setState(() {
                        rooms.add({
                          "roomNumber": rooms.length + 1,
                          "adultsNumber": 2,
                          "childrenNumber": 0
                        });
                      }),
                      onDecreaseTap: () => setState(() {
                        rooms.removeLast();
                      }),
                      itemTitle: "Rooms",
                      itemNumber: rooms.length,
                      limit: rooms.length == 1 ? true : false,
                    )),
                    ListView.separated(
                      itemCount: rooms.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemBuilder: (context, index) => ContainerWithShadow(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Room ${index + 1}")),
                          IncreaseAndDecreaseItemWidget(
                            onIncreaseTap: () => setState(() {
                              rooms[index]['adultsNumber'] =
                                  rooms[index]['adultsNumber']! + 1;
                            }),
                            onDecreaseTap: () => setState(() {
                              rooms[index]['adultsNumber'] =
                                  rooms[index]['adultsNumber']! - 1;
                            }),
                            itemTitle: "Adults",
                            itemNumber: rooms[index]['adultsNumber']!,
                            limit: rooms[index]['adultsNumber'] == 2
                                ? true
                                : false,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          IncreaseAndDecreaseItemWidget(
                            onIncreaseTap: () => setState(() {
                              rooms[index]['childrenNumber'] =
                                  rooms[index]['childrenNumber']! + 1;
                            }),
                            onDecreaseTap: () => setState(() {
                              rooms[index]['childrenNumber'] =
                                  rooms[index]['childrenNumber']! - 1;
                            }),
                            itemTitle: "Children",
                            itemNumber: rooms[index]['childrenNumber']!,
                            limit: rooms[index]['childrenNumber'] == 0
                                ? true
                                : false,
                          ),
                          AgeOfChildNumRowList(
                              childrenNumber: rooms[index]['childrenNumber']!),
                        ],
                      )),
                    ),
                    PetFriendlyRowWidget(
                      petFriendly: petFriendly,
                      onChanged: (value) {
                        setState(() {
                          petFriendly = value;
                        });
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20)),
                        onPressed: () {
                          Navigator.pop(context, rooms);
                        },
                        child: const Text("Apply")))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
