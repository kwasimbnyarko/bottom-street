import 'package:bottom_street/components/performance/percentage_up_and_down.dart';
import 'package:bottom_street/models/performance_model.dart';
import 'package:bottom_street/utils/constants.dart';
import 'package:flutter/material.dart';

class PerformanceItemWidget extends StatelessWidget {
  double absoluteHighestPercentage;
  Performance? item;

  PerformanceItemWidget(
      {required this.absoluteHighestPercentage, required this.item});

  @override
  Widget build(BuildContext context) {
    Color barColor = Colors.green;
    if (item != null) {
      if (item!.changePercent! < 0) {
        barColor = Colors.red;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              (item == null) ? "..." : item!.chartPeriodCode!,
              style: sectionItemStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
                gradient: LinearGradient(
                    //tileMode: TileMode.decal,
                    stops: [
                      (item == null)
                          ? 0
                          : (item!.changePercent! / absoluteHighestPercentage)
                              .abs(),
                      0
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [barColor, Color(0xffe3e3e3)]),
              ),
              width: 35,
              height: 35,
            ),
          ),
          Expanded(
              flex: 2,
              child: PercentegeUpAndDown(
                percentage: (item == null) ? 0 : item!.changePercent,
              ))
        ],
      ),
    );
  }
}
