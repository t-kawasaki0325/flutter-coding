import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/weather.dart';

class MainWidget extends StatelessWidget {
  final Weather weather;
  const MainWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      AspectRatio(
        aspectRatio: 1 / 1,
        child: SvgPicture.asset('images/${weather.weatherCondition}.svg'),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '${weather.maxTemperature} ℃',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.blue),
            ),
            Text(
              '${weather.minTemperature} ℃',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    ]);
  }
}
