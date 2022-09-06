import 'package:bottom_street/api/overview_api.dart';
import 'package:bottom_street/api/performance_api.dart';
import 'package:bottom_street/components/overview/overview_section_item.dart';
import 'package:bottom_street/models/overview.dart';
import 'package:bottom_street/models/performance_model.dart';
import 'package:flutter/material.dart';
import '../components/performance/perfoemance_item_widget.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Overview overview = Overview();
  List<Performance> listOfPerformances = [];
  double? absoluteHighest;
  @override
  void initState() {
    super.initState();
    OverviewAPI overviewAPI = OverviewAPI();
    overviewAPI.getOverview().then((value) {
      setState(() {
        overview = overviewAPI.overview;
      });
    });
    PerformanceApi performanceApi = PerformanceApi();
    performanceApi.getPerformances().then((value) {
      setState(() {
        listOfPerformances = performanceApi.listOfPerformances;
        absoluteHighest = performanceApi.absoluteHighestPerformance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Street"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Overview",
                                style: sectionTitleTextStyle,
                              )
                            ],
                          ),
                          const Divider(thickness: 0.6, color: Colors.grey),
                          Column(
                            children: [
                              OverviewSectionItem(
                                  name: "Sector",
                                  value: (overview.sector == null)
                                      ? "-"
                                      : overview.sector!),
                              OverviewSectionItem(
                                  name: "Industry",
                                  value: (overview.industry == null)
                                      ? "-"
                                      : overview.industry!),
                              OverviewSectionItem(
                                  name: "Market Cap.",
                                  value: (overview.mcap == null)
                                      ? "-"
                                      : overview.mcap!
                                          .toStringAsPrecision(15)
                                          .replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},')),
                              OverviewSectionItem(
                                  name: "Enterprise Value",
                                  value: (overview.ev == null)
                                      ? "-"
                                      : overview.ev!),
                              OverviewSectionItem(
                                  name: "Book Value / Share",
                                  value: (overview.bookNavPerShare == null)
                                      ? "-"
                                      : overview.bookNavPerShare!
                                          .toStringAsPrecision(5)),
                              OverviewSectionItem(
                                  name: "Price-Earning Ratio (PE)",
                                  value: (overview.ttmpe == null)
                                      ? "-"
                                      : overview.ttmpe!.toStringAsPrecision(4)),
                              OverviewSectionItem(
                                  name: "PEG Ratio",
                                  value: (overview.pegRatio == null)
                                      ? "-"
                                      : overview.pegRatio!
                                          .toStringAsPrecision(3)),
                              OverviewSectionItem(
                                  name: "Dividend Yield",
                                  value: (overview.theYield == null)
                                      ? "-"
                                      : overview.theYield!
                                          .toStringAsPrecision(3)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Performance",
                                style: sectionTitleTextStyle,
                              )
                            ],
                          ),
                          const Divider(thickness: 0.6, color: Colors.grey),
                          Column(
                            children: <Widget>[
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[0],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[1],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[2],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[3],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[4],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[5],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[6],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                              PerformanceItemWidget(
                                item: (listOfPerformances.isEmpty)
                                    ? null
                                    : listOfPerformances[7],
                                absoluteHighestPercentage:
                                    (absoluteHighest == null)
                                        ? 100
                                        : absoluteHighest!,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
