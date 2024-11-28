class WeatherUnits {
  String? time;
  String? interval;
  String? temperature;
  String? windSpeed;
  String? windDirection;
  String? isDay;
  String? weatherCode;

  // Construtor
  WeatherUnits({
    this.time,
    this.interval,
    this.temperature,
    this.windSpeed,
    this.windDirection,
    this.isDay,
    this.weatherCode,
  });

  // Método para converter JSON em objeto WeatherUnits
  factory WeatherUnits.fromJson(Map<String, dynamic> json) {
    return WeatherUnits(
      time: json['time'] as String?,
      interval: json['interval'] as String?,
      temperature: json['temperature'] as String?,
      windSpeed: json['windspeed'] as String?,
      windDirection: json['winddirection'] as String?,
      isDay: json['is_day'] as String?,
      weatherCode: json['weatherCode'] as String?,
    );
  }

  // Método para converter objeto WeatherUnits em JSON
  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
      'temperature': temperature,
      'windSpeed': windSpeed,
      'windDirection': windDirection,
      'isDay': isDay,
      'weatherCode': weatherCode,
    };
  }
}
