import 'gumball_machine.dart';

// Remote interface for gumball machine
abstract class GumballMachineRemote {
  int getCount();
  String getLocation();
  String getState();
  void insertQuarter();
  void ejectQuarter();
  void turnCrank();
  String getLog();
}

// Proxy class
class GumballMachineProxy implements GumballMachineRemote {
  final GumballMachine _gumballMachine;
  StringBuffer _proxyLog = StringBuffer();

  GumballMachineProxy(this._gumballMachine);

  @override
  int getCount() {
    _proxyLog.writeln("Proxy: Accessed gumball count");
    return _gumballMachine.getCount();
  }

  @override
  String getLocation() {
    _proxyLog.writeln("Proxy: Accessed location");
    return _gumballMachine.getLocation();
  }

  @override
  String getState() {
    _proxyLog.writeln("Proxy: Accessed state");
    return _gumballMachine.getState();
  }

  @override
  void insertQuarter() {
    _proxyLog.writeln("Proxy: Forwarding insert quarter command");
    _gumballMachine.insertQuarter();
  }

  @override
  void ejectQuarter() {
    _proxyLog.writeln("Proxy: Forwarding eject quarter command");
    _gumballMachine.ejectQuarter();
  }

  @override
  void turnCrank() {
    _proxyLog.writeln("Proxy: Forwarding turn crank command");
    _gumballMachine.turnCrank();
  }

  @override
  String getLog() => _proxyLog.toString() + "\nMachine Log:\n" + _gumballMachine.getLog();
}