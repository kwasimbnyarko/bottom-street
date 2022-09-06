import 'dart:convert';

import 'package:bottom_street/models/performance_model.dart';
import 'package:http/http.dart' as http;

class PerformanceApi {
  List<Performance> listOfPerformances = [];
  double absoluteHighestPerformance = 0;
  Future<void> getPerformances() async {
    Uri url = Uri.parse(
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en");

    final response = await http.get(url);
    List<dynamic> performanceResponse = json.decode(response.body);
    for (Map performance in performanceResponse) {
      Performance tempPerformance = Performance();
      tempPerformance.id = (performance["ID"] != null) ? performance["ID"] : 0;
      tempPerformance.label =
          (performance["Label"] != null) ? performance["label"] : "NA";
      tempPerformance.chartPeriodCode = (performance["ChartPeriodCode"] != null)
          ? performance["ChartPeriodCode"]
          : "NA";
      tempPerformance.changePercent = (performance["ChangePercent"] != null)
          ? performance["ChangePercent"]
          : 0;

      listOfPerformances.add(tempPerformance);
      if (tempPerformance.changePercent!.abs() > absoluteHighestPerformance) {
        absoluteHighestPerformance = tempPerformance.changePercent!.abs();
      }
    }
  }
}
