class WeatherModel {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final int elevation;
  final CurrentUnits currentUnits;
  final Current current;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    generationtimeMs: json["generationtime_ms"]?.toDouble(),
    utcOffsetSeconds: json["utc_offset_seconds"],
    timezone: json["timezone"],
    timezoneAbbreviation: json["timezone_abbreviation"],
    elevation: json["elevation"],
    currentUnits: CurrentUnits.fromJson(json["current_units"]),
    current: Current.fromJson(json["current"]),
  );
}

class Current {
  final String time;
  final int interval;
  final double temperature2M;
  final int isDay;
  final double apparentTemperature;
  final int relativeHumidity2M;
  final int weatherCode;
  final int precipitation;
  final int rain;
  final int showers;
  final int snowfall;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.isDay,
    required this.apparentTemperature,
    required this.relativeHumidity2M,
    required this.weatherCode,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowfall,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"]?.toDouble(),
    isDay: json["is_day"],
    apparentTemperature: json["apparent_temperature"]?.toDouble(),
    relativeHumidity2M: json["relative_humidity_2m"],
    weatherCode: json["weather_code"],
    precipitation: json["precipitation"],
    rain: json["rain"],
    showers: json["showers"],
    snowfall: json["snowfall"],
  );
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2M;
  final String isDay;
  final String apparentTemperature;
  final String relativeHumidity2M;
  final String weatherCode;
  final String precipitation;
  final String rain;
  final String showers;
  final String snowfall;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2M,
    required this.isDay,
    required this.apparentTemperature,
    required this.relativeHumidity2M,
    required this.weatherCode,
    required this.precipitation,
    required this.rain,
    required this.showers,
    required this.snowfall,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
    isDay: json["is_day"],
    apparentTemperature: json["apparent_temperature"],
    relativeHumidity2M: json["relative_humidity_2m"],
    weatherCode: json["weather_code"],
    precipitation: json["precipitation"],
    rain: json["rain"],
    showers: json["showers"],
    snowfall: json["snowfall"],
  );
}
