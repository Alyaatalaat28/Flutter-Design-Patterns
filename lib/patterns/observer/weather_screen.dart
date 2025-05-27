import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/patterns/observer/display.dart';
import 'weather_data.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherData _weatherData = WeatherData();
  late final CurrentConditionsDisplay _currentDisplay;
  late final StatisticsDisplay _statsDisplay;
  final _tempController = TextEditingController();
  final _humidityController = TextEditingController();
  final _pressureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentDisplay = CurrentConditionsDisplay(_weatherData);
    _statsDisplay = StatisticsDisplay(_weatherData);
  }

  void _updateMeasurements() {
    final temp = double.tryParse(_tempController.text) ?? 0.0;
    final humidity = double.tryParse(_humidityController.text) ?? 0.0;
    final pressure = double.tryParse(_pressureController.text) ?? 0.0;
    _weatherData.setMeasurements(temp, humidity, pressure);
    setState(() {});
  }

  @override
  void dispose() {
    _tempController.dispose();
    _humidityController.dispose();
    _pressureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Observer Pattern - Weather Station')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Weather Measurements:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _tempController,
              decoration: const InputDecoration(labelText: 'Temperature (°C)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _humidityController,
              decoration: const InputDecoration(labelText: 'Humidity (%)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _pressureController,
              decoration: const InputDecoration(labelText: 'Pressure (hPa)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateMeasurements,
              child: const Text('Update Measurements'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Displays:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(_currentDisplay.display(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(_statsDisplay.display(), style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
