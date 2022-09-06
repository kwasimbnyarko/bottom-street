import 'package:flutter/material.dart';

class PercentegeUpAndDown extends StatelessWidget {
  final double? percentage;
  const PercentegeUpAndDown({required this.percentage});

  @override
  Widget build(BuildContext context) {
    bool isUp = true;
    if (percentage! < 0) {
      isUp = false;
    }
    return Row(
      children: [
        Icon((isUp) ? Icons.arrow_upward : Icons.arrow_downward,
            color: (isUp) ? Colors.green : Colors.red),
        Text(
          percentage!.toStringAsFixed(1) + "%",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: (isUp) ? Colors.green : Colors.red),
        )
      ],
    );
  }
}
