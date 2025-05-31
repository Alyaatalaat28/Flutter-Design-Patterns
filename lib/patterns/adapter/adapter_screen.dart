import 'package:flutter/material.dart';
import 'duck.dart';
import 'turkey.dart';

class AdapterScreen extends StatefulWidget {
  const AdapterScreen({super.key});

  @override
  _AdapterScreenState createState() => _AdapterScreenState();
}

class _AdapterScreenState extends State<AdapterScreen> {
  Duck _selectedBird = MallardDuck();
  String _output = "Select a bird and try its behaviors!";
  final _birds = {
    'Mallard Duck': MallardDuck(),
    'Turkey (Adapted)': TurkeyAdapter(WildTurkey()),
  };

  void _updateBird(String? birdName) {
    setState(() {
      _selectedBird = _birds[birdName] ?? MallardDuck();
      _output = "Selected: $birdName";
    });
  }

  void _performQuack() {
    setState(() {
      _output = _selectedBird.quack();
    });
  }

  void _performFly() {
    setState(() {
      _output = _selectedBird.fly();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adapter Pattern - Duck & Turkey')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Bird:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _birds.keys.firstWhere(
                (key) => _birds[key] == _selectedBird,
                orElse: () => 'Mallard Duck',
              ),
              items: _birds.keys
                  .map((name) => DropdownMenuItem<String>(
                        value: name,
                        child: Text(name),
                      ))
                  .toList(),
              onChanged: _updateBird,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _performQuack,
                  child: const Text('Quack'),
                ),
                ElevatedButton(
                  onPressed: _performFly,
                  child: const Text('Fly'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Output:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _output,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
