import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainWidget extends StatelessWidget {
  final String weather;
  const MainWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      AspectRatio(
        aspectRatio: 1 / 1,
        child: SvgPicture.asset('images/$weather.svg'),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '** ℃',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.blue),
            ),
            Text(
              '** ℃',
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
