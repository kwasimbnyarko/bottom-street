import 'package:bottom_street/api/overview_api.dart';
import 'package:bottom_street/components/section_property.dart';
import 'package:bottom_street/models/overview.dart';
import 'package:flutter/material.dart';
import '../components/percentage_up_and_down.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Overview overview = Overview();
  @override
  void initState() {
    super.initState();
    OverviewAPI overviewAPI = OverviewAPI();
    overviewAPI.getOverview().then((value) {
      setState(() {
        overview = overviewAPI.overview;
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
                              OverviewSectionProperty(
                                  name: "Sector",
                                  value: (overview.sector == null)
                                      ? "-"
                                      : overview.sector!),
                              OverviewSectionProperty(
                                  name: "Industry",
                                  value: (overview.industry == null)
                                      ? "-"
                                      : overview.industry!),
                              OverviewSectionProperty(
                                  name: "Market Cap.",
                                  value: (overview.mcap == null)
                                      ? "-"
                                      : overview.mcap!
                                          .toStringAsPrecision(15)
                                          .replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},')),
                              OverviewSectionProperty(
                                  name: "Enterprise Value",
                                  value: (overview.ev == null)
                                      ? "-"
                                      : overview.ev!),
                              OverviewSectionProperty(
                                  name: "Book Value / Share",
                                  value: (overview.bookNavPerShare == null)
                                      ? "-"
                                      : overview.bookNavPerShare!
                                          .toStringAsPrecision(5)),
                              OverviewSectionProperty(
                                  name: "Price-Earning Ratio (PE)",
                                  value: (overview.ttmpe == null)
                                      ? "-"
                                      : overview.ttmpe!.toStringAsPrecision(4)),
                              OverviewSectionProperty(
                                  name: "PEG Ratio",
                                  value: (overview.pegRatio == null)
                                      ? "-"
                                      : overview.pegRatio!
                                          .toStringAsPrecision(3)),
                              OverviewSectionProperty(
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("1 Day"),
                                  Container(
                                    color: Colors.grey,
                                    width: 10,
                                    height: 10,
                                  ),
                                  PercentegeUpAndDown()
                                ],
                              )
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
