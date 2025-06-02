import 'package:flutter/material.dart';
import 'gumball_machine.dart';

class GumballScreen extends StatefulWidget {
  const GumballScreen({super.key});

  @override
  _GumballScreenState createState() => _GumballScreenState();
}

class _GumballScreenState extends State<GumballScreen> {
  final GumballMachine _gumballMachine = GumballMachine(count: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Pattern - Gumball Machine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gumball Machine Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _gumballMachine.getStatus(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _gumballMachine.insertQuarter();
                    setState(() {});
                  },
                  child: const Text('Insert Quarter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _gumballMachine.ejectQuarter();
                    setState(() {});
                  },
                  child: const Text('Eject Quarter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _gumballMachine.turnCrank();
                    setState(() {});
                  },
                  child: const Text('Turn Crank'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Action Log:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _gumballMachine.getLog(),
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
