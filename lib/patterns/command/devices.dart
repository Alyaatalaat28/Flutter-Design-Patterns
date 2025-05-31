// Light device
// ignore_for_file: avoid_print

class Light {
  String location;
  bool _isOn = false;

  Light(this.location);

  void on() {
    _isOn = true;
    print("$location light is ON");
  }

  void off() {
    _isOn = false;
    print("$location light is OFF");
  }

  String getStatus() => "$location Light: ${_isOn ? 'ON' : 'OFF'}";
}

// CeilingFan device
class CeilingFan {
  String location;
  int speed = speedOff;
  static const int speedHigh = 3;
  static const int speedMedium = 2;
  static const int speedLow = 1;
  static const int speedOff = 0;

  CeilingFan(this.location);

  void setHigh() {
    speed = speedHigh;
    print("$location ceiling fan is on HIGH");
  }

  void setMedium() {
    speed = speedMedium;
    print("$location ceiling fan is on MEDIUM");
  }

  void setLow() {
    speed = speedLow;
    print("$location ceiling fan is on LOW");
  }

  void turnOff() {
    speed = speedOff;
    print("$location ceiling fan is OFF");
  }

  String getStatus() =>
      "$location Ceiling Fan: ${speed == speedOff ? 'OFF' : 'Speed $speed'}";
}
