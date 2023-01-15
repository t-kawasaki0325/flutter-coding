import 'dart:ffi';

class Weather {
  final String weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final String date;

  Weather(
    this.weatherCondition,
    this.maxTemperature,
    this.minTemperature,
    this.date,
  );

  Weather.fromJson(Map<String, dynamic> json)
      : weatherCondition = json['weather_condition']! as String,
        maxTemperature = json['max_temperature']! as int,
        minTemperature = json['min_temperature']! as int,
        date = json['date']! as String;
}
