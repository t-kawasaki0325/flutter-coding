import 'package:flutter/material.dart';
import 'package:flutter_training/large_button.dart';
import 'package:flutter_training/main_widget.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

void main() {
  runApp(const WeatherForecastApp());
}

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherForecast(title: 'Forecast'),
    );
  }
}

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key, required this.title});

  final String title;

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  String _weather = 'sunny';

  void _close() {}
  void _reload() {
    final yumemiWeather = YumemiWeather();
    final weatherCondition = yumemiWeather.fetchSimpleWeather();
    setState(() {
      _weather = weatherCondition;
    });
  }

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
            child: MainWidget(weather: _weather),
          ),
        ),
        Flexible(
            child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(
            margin: const EdgeInsets.only(top: 80),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LargeButton(label: 'Close', action: _close),
                  LargeButton(label: 'Reload', action: _reload)
                ]),
          ),
        ))
      ],
    )));
  }
}
