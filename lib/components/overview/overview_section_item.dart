import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/constants.dart';

class OverviewSectionItem extends StatelessWidget {
  final String name;
  final String value;

  const OverviewSectionItem(
      {super.key, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    bool hasBankInValue = false;
    if (value.startsWith("Bank")) {
      hasBankInValue = true;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: sectionItemStyle,
          ),
          Row(children: <Widget>[
            FaIcon(
              FontAwesomeIcons.buildingColumns,
              color: (hasBankInValue) ? appGoldColor : const Color(0x00ffffff),
            ),
            Text(
              value,
              style: sectionItemStyle,
            ),
          ])
        ],
      ),
    );
  }
}
