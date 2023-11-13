import 'package:flutter/material.dart';

class AgeOfChildNumRowList extends StatelessWidget {
  const AgeOfChildNumRowList({
    super.key,
    required this.childrenNumber,
  });

  final int childrenNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: childrenNumber,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => Row(
        children: [
          const Spacer(flex: 2),
          Text("Age of child ${index + 1}"),
          const Spacer(flex: 5),
          const Text(
            "14  years",
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
