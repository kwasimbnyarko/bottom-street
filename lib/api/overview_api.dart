import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/overview.dart';

class OverviewAPI {
  Overview overview = Overview();
  Future<void> getOverview() async {
    Uri url = Uri.parse(
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en");

    final response = await http.get(url);

    Map<String, dynamic> overviewResponse = json.decode(response.body);
    overview.id =
        (overviewResponse["ID"] != null) ? overviewResponse["ID"] : "NA";
    overview.security = (overviewResponse["Security"] != null)
        ? overviewResponse["Security"]
        : "NA";
    overview.industry = (overviewResponse["Industry"] != null)
        ? overviewResponse["Industry"]
        : "NA";
    overview.industryId = (overviewResponse["IndustryID"] != null)
        ? overviewResponse["IndustryID"]
        : "NA";
    overview.sector = (overviewResponse["Sector"] != null)
        ? overviewResponse["Sector"]
        : "NA";
    overview.sectorId = (overviewResponse["SectorID"] != null)
        ? overviewResponse["SectorID"]
        : "NA";
    overview.mcap =
        (overviewResponse["MCAP"] != null) ? overviewResponse["MCAP"] : "NA";
    overview.evDateEnd = (overviewResponse["EVDateEnd"] != null)
        ? overviewResponse["EVDateEnd"]
        : "NA";
    overview.bookNavPerShare = (overviewResponse["BookNavPerShare"] != null)
        ? overviewResponse["BookNavPerShare"]
        : "NA";
    overview.ttmpe =
        (overviewResponse["TTMPE"] != null) ? overviewResponse["TTMPE"] : "NA";
    overview.ttmYearEnd = (overviewResponse["TTMYearEnd"] != null)
        ? overviewResponse["TTMYearEnd"]
        : "NA";
    overview.theYield =
        (overviewResponse["Yield"] != null) ? overviewResponse["Yield"] : "NA";
    overview.yearEnd = (overviewResponse["YearEnd"] != null)
        ? overviewResponse["YearEnd"]
        : "NA";
    overview.sectorSlug = (overviewResponse["SectorSlug"] != null)
        ? overviewResponse["SectorSlug"]
        : "NA";
    overview.industrySlug = (overviewResponse["IndustrySlug"] != null)
        ? overviewResponse["IndustrySlug"]
        : "NA";
    overview.securitySlug = (overviewResponse["SecuritySlug"] != null)
        ? overviewResponse["SecuritySlug"]
        : "NA";
    overview.pegRatio = (overviewResponse["PEGRatio"] != null)
        ? overviewResponse["PEGRatio"]
        : "NA";
  }
}
