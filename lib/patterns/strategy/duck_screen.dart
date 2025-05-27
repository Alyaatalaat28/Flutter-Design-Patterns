import 'package:flutter/material.dart';
import 'duck.dart';
import 'behaviors.dart';

class DuckScreen extends StatefulWidget {
  const DuckScreen({super.key});

  @override
  _DuckScreenState createState() => _DuckScreenState();
}

class _DuckScreenState extends State<DuckScreen> {
  Duck _currentDuck = MallardDuck();
  String _output = "Select a duck and try its behaviors!";
  final List<Duck> _ducks = [MallardDuck(), RubberDuck(), DecoyDuck()];

  void _updateDuck(String? duckType) {
    setState(() {
      switch (duckType) {
        case 'Mallard Duck':
          _currentDuck = MallardDuck();
          break;
        case 'Rubber Duck':
          _currentDuck = RubberDuck();
          break;
        case 'Decoy Duck':
          _currentDuck = DecoyDuck();
          break;
      }
      _output = _currentDuck.display();
    });
  }

  void _performFly() {
    setState(() {
      _output = _currentDuck.performFly();
    });
  }

  void _performQuack() {
    setState(() {
      _output = _currentDuck.performQuack();
    });
  }

  void _changeFlyBehavior(String? behavior) {
    setState(() {
      if (behavior == 'Fly with Wings') {
        _currentDuck.setFlyBehavior(FlyWithWings());
      } else {
        _currentDuck.setFlyBehavior(FlyNoWay());
      }
      _output = "Fly behavior changed!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Strategy Pattern - Duck Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a Duck:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              hint: const Text('Choose a duck'),
              isExpanded: true,
              value: _currentDuck.display().replaceFirst("I'm a ", ""),
              items: _ducks.map((duck) {
                return DropdownMenuItem<String>(
                  value: duck.display().replaceFirst("I'm a ", ""),
                  child: Text(duck.display()),
                );
              }).toList(),
              onChanged: _updateDuck,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _performFly,
                  child: const Text('Fly'),
                ),
                ElevatedButton(
                  onPressed: _performQuack,
                  child: const Text('Quack'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Change Fly Behavior:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              hint: const Text('Choose fly behavior'),
              isExpanded: true,
              items: ['Fly with Wings', 'No Fly'].map((behavior) {
                return DropdownMenuItem<String>(
                  value: behavior,
                  child: Text(behavior),
                );
              }).toList(),
              onChanged: _changeFlyBehavior,
            ),
            const SizedBox(height: 20),
            Text(
              'Output: $_output',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
