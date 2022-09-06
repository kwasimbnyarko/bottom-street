import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SectionProperty extends StatelessWidget {
  final String? name;
  final String? value;

  const SectionProperty({super.key, required this.value, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Sector",
            style: sectionPropertyStyle,
          ),
          Text(
            "Banking",
            style: sectionPropertyStyle,
          )
        ],
      ),
    );
  }
}
