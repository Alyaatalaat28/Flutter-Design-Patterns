// Subject interface
abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

// Observer interface
abstract class Observer {
  void update(double temperature, double humidity, double pressure);
}

// WeatherData (Subject) implementation
class WeatherData implements Subject {
  final List<Observer> _observers = [];
  double _temperature = 0.0;
  double _humidity = 0.0;
  double _pressure = 0.0;

  @override
  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_temperature, _humidity, _pressure);
    }
  }

  void setMeasurements(double temperature, double humidity, double pressure) {
    _temperature = temperature;
    _humidity = humidity;
    _pressure = pressure;
    notifyObservers();
  }
}
