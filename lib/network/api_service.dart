import 'package:http/http.dart';

const String todayCasesUrl = 'https://disease.sh/v3/covid-19/all';

class TrackerService {
  Future<dynamic> getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));
    if(response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}