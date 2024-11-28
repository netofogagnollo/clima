class Weather {
  String? time;
  int? interval;
  double? temperature;
  double? windSpeed;
  double? windDirection;
  int? isDay;
  int? weatherCode;

  // Construtor
  Weather({
    this.time,
    this.interval,
    this.temperature,
    this.windSpeed,
    this.windDirection,
    this.isDay,
    this.weatherCode,
  });

  // Método para converter JSON em objeto Weather
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      time: json['time'] as String?,
      interval: json['interval'] as int?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      windSpeed: (json['windspeed'] as num?)?.toDouble(),
      windDirection: (json['winddirection'] as num?)?.toDouble(),
      isDay: json['is_day'] as int?,
      weatherCode: json['weathercode'] as int?,
    );
  }

  // Método para converter objeto Weather em JSON
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
