import 'package:flutter/material.dart';
import 'command.dart';
import 'devices.dart';
import 'remote_control.dart';

class RemoteScreen extends StatefulWidget {
  const RemoteScreen({super.key});

  @override
  _RemoteScreenState createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  final RemoteControl _remote = RemoteControl();
  late final Light _livingRoomLight;
  late final CeilingFan _livingRoomFan;

  @override
  void initState() {
    super.initState();
    _livingRoomLight = Light("Living Room");
    _livingRoomFan = CeilingFan("Living Room");
    // Set commands for slot 0 (Light) and slot 1 (Ceiling Fan)
    _remote.setCommand(
        0, LightOnCommand(_livingRoomLight), LightOffCommand(_livingRoomLight));
    _remote.setCommand(1, CeilingFanHighCommand(_livingRoomFan),
        CeilingFanOffCommand(_livingRoomFan));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Command Pattern - Remote Control')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Remote Control',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Light Status: ${_livingRoomLight.getStatus()}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Fan Status: ${_livingRoomFan.getStatus()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Control Devices:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _remote.onButtonPressed(0);
                    setState(() {});
                  },
                  child: const Text('Light ON'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _remote.offButtonPressed(0);
                    setState(() {});
                  },
                  child: const Text('Light OFF'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _remote.onButtonPressed(1);
                    setState(() {});
                  },
                  child: const Text('Fan HIGH'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _remote.offButtonPressed(1);
                    setState(() {});
                  },
                  child: const Text('Fan OFF'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _remote.undoButtonPressed();
                setState(() {});
              },
              child: const Text('Undo Last Command'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Command Log:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _remote.getLog(),
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
