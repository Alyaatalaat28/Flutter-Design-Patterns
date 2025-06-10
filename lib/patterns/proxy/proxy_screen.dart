import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/patterns/proxy/gumball_machine.dart' as gumball_machine ;
import 'proxy.dart';

class ProxyScreen extends StatefulWidget {
  const ProxyScreen({super.key});

  @override
  _ProxyScreenState createState() => _ProxyScreenState();
}

class _ProxyScreenState extends State<ProxyScreen> {
  final GumballMachineRemote _proxy = GumballMachineProxy(
    gumball_machine.GumballMachine(count: 5, location: "Downtown Arcade"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Proxy Pattern - Gumball Machine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gumball Machine Monitor (via Proxy)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Location: ${_proxy.getLocation()}\n"
              "Gumballs: ${_proxy.getCount()}\n"
              "State: ${_proxy.getState()}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _proxy.insertQuarter();
                    setState(() {});
                  },
                  child: const Text('Insert Quarter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _proxy.ejectQuarter();
                    setState(() {});
                  },
                  child: const Text('Eject Quarter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _proxy.turnCrank();
                    setState(() {});
                  },
                  child: const Text('Turn Crank'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Proxy and Machine Log:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _proxy.getLog(),
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