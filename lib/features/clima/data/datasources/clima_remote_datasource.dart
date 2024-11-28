import 'dart:convert';
import 'package:http/http.dart' as http;

class ClimaRemoteDatasource {
  final String baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<Map<String, dynamic>> fetchWeather(double latitude, double longitude) async {
    final url = Uri.parse('$baseUrl?latitude=$latitude&longitude=$longitude&current_weather=true');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar os dados do clima');
    }
  }
}
