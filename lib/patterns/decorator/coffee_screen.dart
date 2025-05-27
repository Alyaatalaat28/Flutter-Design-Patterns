import 'package:flutter/material.dart';
import 'beverage.dart';
import 'beverages.dart';
import 'condiments.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({Key? key}) : super(key: key);

  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  // List of available beverages for the dropdown
  final List<String> _beverageTypes = ['House Blend', 'Dark Roast', 'Espresso'];
  String _selectedBeverage = 'House Blend'; // Initial selection
  bool _mocha = false;
  bool _soy = false;
  bool _whip = false;

  // Build the beverage with selected condiments
  Beverage _buildBeverage() {
    Beverage beverage;
    switch (_selectedBeverage) {
      case 'Espresso':
        beverage = Espresso();
        break;
      case 'Dark Roast':
        beverage = DarkRoast();
        break;
      case 'House Blend':
      default:
        beverage = HouseBlend();
        break;
    }
    if (_mocha) beverage = Mocha(beverage);
    if (_soy) beverage = Soy(beverage);
    if (_whip) beverage = Whip(beverage);
    return beverage;
  }

  // Update the UI when selections change
  void _updateBeverage(String? value) {
    if (value != null) {
      setState(() {
        _selectedBeverage = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentBeverage = _buildBeverage();
    return Scaffold(
      appBar: AppBar(title: const Text('Decorator Pattern - Coffee Shop')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Base Beverage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedBeverage,
              items: _beverageTypes
                  .map((String beverage) => DropdownMenuItem<String>(
                        value: beverage,
                        child: Text(beverage),
                      ))
                  .toList(),
              onChanged: _updateBeverage,
            ),
            const SizedBox(height: 20),
            const Text(
              'Add Condiments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('Mocha (+\$0.20)'),
              value: _mocha,
              onChanged: (bool? value) {
                setState(() {
                  _mocha = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Soy (+\$0.15)'),
              value: _soy,
              onChanged: (bool? value) {
                setState(() {
                  _soy = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Whip (+\$0.10)'),
              value: _whip,
              onChanged: (bool? value) {
                setState(() {
                  _whip = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Order: ${currentBeverage.getDescription()}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Total Cost: \$${currentBeverage.cost().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}