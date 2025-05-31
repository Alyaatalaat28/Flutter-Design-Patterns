import 'command.dart';

class RemoteControl {
  List<Command> onCommands = [];
  List<Command> offCommands = [];
  Command? lastCommand;
  StringBuffer log = StringBuffer();

  RemoteControl() {
    // Initialize with no-op commands
    for (int i = 0; i < 7; i++) {
      onCommands.add(NoCommand());
      offCommands.add(NoCommand());
    }
  }

  void setCommand(int slot, Command onCommand, Command offCommand) {
    onCommands[slot] = onCommand;
    offCommands[slot] = offCommand;
  }

  void onButtonPressed(int slot) {
    onCommands[slot].execute();
    lastCommand = onCommands[slot];
    log.writeln("Executed: ${onCommands[slot].runtimeType}");
  }

  void offButtonPressed(int slot) {
    offCommands[slot].execute();
    lastCommand = offCommands[slot];
    log.writeln("Executed: ${offCommands[slot].runtimeType}");
  }

  void undoButtonPressed() {
    if (lastCommand != null) {
      lastCommand!.undo();
      log.writeln("Undid: ${lastCommand!.runtimeType}");
    } else {
      log.writeln("Nothing to undo");
    }
  }

  String getLog() => log.toString();
}

// No-op command for initialization
class NoCommand implements Command {
  @override
  void execute() {}
  @override
  void undo() {}
}
