import 'package:flutter/material.dart';
import 'caffeine_beverage.dart';

class BeverageScreen extends StatefulWidget {
  const BeverageScreen({super.key});

  @override
  _BeverageScreenState createState() => _BeverageScreenState();
}

class _BeverageScreenState extends State<BeverageScreen> {
  CaffeineBeverage _beverage = Coffee();
  final _beverages = {'Coffee': Coffee(), 'Tea': Tea()};

  void _updateBeverage(String? beverageName) {
    setState(() {
      _beverage = _beverages[beverageName] ?? Coffee();
      _beverage.log.clear(); // Reset log for new beverage
    });
  }

  void _prepareBeverage() {
    setState(() {
      _beverage.prepareRecipe();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Template Method - Beverage Prep')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Beverage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _beverage.getName(),
              items: _beverages.keys
                  .map((name) => DropdownMenuItem<String>(
                        value: name,
                        child: Text(name),
                      ))
                  .toList(),
              onChanged: _updateBeverage,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _prepareBeverage,
              child: const Text('Prepare Beverage'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Preparation Steps:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _beverage.getLog().isEmpty
                      ? "Select a beverage and prepare it!"
                      : _beverage.getLog(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}