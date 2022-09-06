import 'package:flutter/material.dart';

class PercentegeUpAndDown extends StatelessWidget {
  const PercentegeUpAndDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(Icons.arrow_upward, color: Colors.green), Text("44")],
    );
  }
}
