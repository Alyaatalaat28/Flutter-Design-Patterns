// Interface for displays
import 'package:flutter_design_patterns/patterns/observer/weather_data.dart';

abstract class DisplayElement {
  // Method to display the current state
  String display();
}

// CurrentConditionsDisplay: Shows current temperature and humidity
class CurrentConditionsDisplay implements DisplayElement, Observer {
  double _temperature = 0.0;
  double _humidity = 0.0;

  // Reference to the subject (WeatherData)
  final WeatherData _weatherData;

  CurrentConditionsDisplay(this._weatherData) {
    // Register this display as an observer
    _weatherData.registerObserver(this);
  }

  @override
  void update(double temperature, double humidity, double pressure) {
    _temperature = temperature;
    _humidity = humidity;
    display();
  }

  @override
  String display() => "Current Conditions: $_temperature°C, $_humidity% humidity";
}

// StatisticsDisplay: Tracks and shows average temperature
class StatisticsDisplay implements Observer, DisplayElement {
  double _totalTemp = 0.0;
  int _numReadings = 0;
  final Subject weatherData;

  StatisticsDisplay(this.weatherData) {
    weatherData.registerObserver(this);
  }

  @override
  void update(double temperature, double humidity, double pressure) {
    _totalTemp += temperature;
    _numReadings++;
  }

  @override
  String display() {
    final avgTemp = _numReadings > 0 ? _totalTemp / _numReadings : 0.0;
    return "Statistics: Avg Temp: ${avgTemp.toStringAsFixed(1)}°C";
  }
}
