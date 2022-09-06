import 'package:http/http.dart' as http;

class OverviewAPI {
  Future<void> getOverview() async {
    Uri url = Uri.parse(
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en");

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
  }
}
