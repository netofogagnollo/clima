import 'package:clima/features/clima/data/datasources/clima_remote_datasource.dart';

class ClimaRepository {
  Future<Map<String, dynamic>> getClima() async {
    return await ClimaRemoteDatasource().fetchWeather(00, 00);
  }
}
