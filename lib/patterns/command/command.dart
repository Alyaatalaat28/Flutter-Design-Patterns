// Command interface
import 'package:flutter_design_patterns/patterns/command/devices.dart';

abstract class Command {
  void execute();
  void undo();
}

// Light On Command
class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() => light.on();

  @override
  void undo() => light.off();
}

// Light Off Command
class LightOffCommand implements Command {
  final Light light;

  LightOffCommand(this.light);

  @override
  void execute() => light.off();

  @override
  void undo() => light.on();
}

// Ceiling Fan High Command
class CeilingFanHighCommand implements Command {
  final CeilingFan fan;
  int prevSpeed;

  CeilingFanHighCommand(this.fan) : prevSpeed = fan.speed;

  @override
  void execute() {
    prevSpeed = fan.speed;
    fan.setHigh();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.speedHigh) {
      fan.setHigh();
    } else if (prevSpeed == CeilingFan.speedMedium) {
      fan.setMedium();
    } else if (prevSpeed == CeilingFan.speedLow) {
      fan.setLow();
    } else {
      fan.turnOff();
    }
  }
}

// Ceiling Fan Off Command
class CeilingFanOffCommand implements Command {
  final CeilingFan fan;
  int prevSpeed;

  CeilingFanOffCommand(this.fan) : prevSpeed = fan.speed;

  @override
  void execute() {
    prevSpeed = fan.speed;
    fan.turnOff();
  }

  @override
  void undo() {
    if (prevSpeed == CeilingFan.speedHigh) {
      fan.setHigh();
    } else if (prevSpeed == CeilingFan.speedMedium) {
      fan.setMedium();
    } else if (prevSpeed == CeilingFan.speedLow) {
      fan.setLow();
    } else {
      fan.turnOff();
    }
  }
}
