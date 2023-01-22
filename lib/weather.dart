import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Weather({
    required String weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required String date,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
