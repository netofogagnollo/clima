import 'package:clima/features/clima/domain/entites/weather.dart';
import 'package:clima/features/clima/domain/entites/weather_units.dart';

class ClimaEntity {
  double? latitude;
  double? longitude;
  double? generationTime;
  double? utcOffset;
  String? timeZone;
  String? timeZoneAbv;
  double? elevation;
  WeatherUnits? weatherUnits;
  Weather? weather;

  // Construtor
  ClimaEntity(
      {this.latitude,
      this.longitude,
      this.generationTime,
      this.utcOffset,
      this.timeZone,
      this.timeZoneAbv,
      this.elevation,
      this.weather,
      this.weatherUnits});

  // Método para converter JSON em objeto ClimaEntity
  factory ClimaEntity.fromJson(Map<String, dynamic> json) {
    return ClimaEntity(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      generationTime: (json['generationtime_ms'] as num?)?.toDouble(),
      utcOffset: (json['utc_offset_seconds'] as num?)?.toDouble(),
      timeZone: json['timezone'] as String?,
      timeZoneAbv: json['timezone_abbreviation'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
    );
  }

  // Método para converter objeto ClimaEntity em JSON
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationTime,
      'utc_offset_seconds': utcOffset,
      'timezone': timeZone,
      'timezone_abbreviation': timeZoneAbv,
      'elevation': elevation,
    };
  }
}
