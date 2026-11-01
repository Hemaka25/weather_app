import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '21ca732186169a855e208219483535b0';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'q': city,
        'appid': apiKey,
        'units': 'metric',
      },
    );

    final response = await http.get(url);

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'API Error ${response.statusCode}: ${response.body}',
      );
    }
  }

  // Get forecast information
  Future<List<dynamic>> getForecast(String city) async {
    final url = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/forecast',
      {
        'q': city,
        'appid': apiKey,
        'units': 'metric',
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['list'];
    } else {
      throw Exception(
        'Forecast API Error ${response.statusCode}: ${response.body}',
      );
    }
  }
}
