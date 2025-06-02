import 'package:flutter/material.dart';
import 'subsystem.dart';
import 'facade.dart';

class TheaterScreen extends StatefulWidget {
  const TheaterScreen({super.key});

  @override
  _TheaterScreenState createState() => _TheaterScreenState();
}

class _TheaterScreenState extends State<TheaterScreen> {
  late final HomeTheaterFacade _facade;
  final _movieController = TextEditingController(text: "Flutter: The Movie");

  @override
  void initState() {
    super.initState();
    // Initialize subsystem components
    final amp = Amplifier("Top-O-Line Amplifier");
    final dvd = DvdPlayer("Top-O-Line DVD Player");
    final projector = Projector("Top-O-Line Projector");
    final screen = Screen("Theater Screen");
    final lights = TheaterLights("Theater Ceiling Lights");

    // Initialize facade
    _facade = HomeTheaterFacade(
      amp: amp,
      dvd: dvd,
      projector: projector,
      screen: screen,
      lights: lights,
    );
  }

  @override
  void dispose() {
    _movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Facade Pattern - Home Theater')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Home Theater Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _movieController,
              decoration: const InputDecoration(labelText: 'Movie Title'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _facade.watchMovie(_movieController.text);
                    setState(() {});
                  },
                  child: const Text('Watch Movie'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _facade.endMovie();
                    setState(() {});
                  },
                  child: const Text('End Movie'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'System Status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              _facade.getSystemStatus(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Action Log:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _facade.getLog(),
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
