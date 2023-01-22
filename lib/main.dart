import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/after_layout_mixin.dart';
import 'package:flutter_training/error_dialog.dart';
import 'package:flutter_training/large_button.dart';
import 'package:flutter_training/main_widget.dart';
import 'package:flutter_training/weather.dart';
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

class _WeatherForecastState extends State<WeatherForecast>
    with AfterLayoutMixin {
  Weather _weather = const Weather(
    weatherCondition: 'sunny',
    maxTemperature: 0,
    minTemperature: 0,
    date: '',
  );

  void _close() {
    Platform.isIOS ? exit(0) : SystemNavigator.pop();
  }

  void _reload() {
    final yumemiWeather = YumemiWeather();
    const jsonString = '''
      {
          "area": "tokyo",
          "date": "2020-04-01T12:00:00+09:00"
      }''';
    try {
      final weatherJson = yumemiWeather.fetchWeather(jsonString);
      final decoded = json.decode(weatherJson) as Map<String, dynamic>;
      setState(() {
        _weather = Weather.fromJson(decoded);
      });
    } catch (_) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return ErrorDialog();
        },
      );
    }
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
                    ],
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
