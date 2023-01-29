import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/after_layout_mixin.dart';
import 'package:flutter_training/exit_button.dart';
import 'package:flutter_training/main_widget.dart';
import 'package:flutter_training/reload_button.dart';
import 'package:flutter_training/weather.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const WeatherForecastApp());
}

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherForecast(),
      ),
    );
  }
}

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: MainWidget(),
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [ExitButton(), ReloadButton()],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

@immutable
class WeatherState {
  const WeatherState(
      {this.weather = const Weather(
          date: '',
          weatherCondition: 'sunny',
          maxTemperature: 0,
          minTemperature: 0)});

  final Weather weather;

  WeatherState copyWith({Weather? weather}) {
    return WeatherState(weather: weather ?? this.weather);
  }
}

class WeatherStateNotifier extends StateNotifier<WeatherState> {
  WeatherStateNotifier() : super(const WeatherState());

  void update() {
    final yumemiWeather = YumemiWeather();
    const jsonString = '''
      {
          "area": "tokyo",
          "date": "2020-04-01T12:00:00+09:00"
      }''';
    final weatherJson = yumemiWeather.fetchWeather(jsonString);
    final decoded = json.decode(weatherJson) as Map<String, dynamic>;
    state = state.copyWith(weather: Weather.fromJson(decoded));
  }
}

final weatherStateProvider =
    StateNotifierProvider<WeatherStateNotifier, WeatherState>((ref) {
  return WeatherStateNotifier();
});
