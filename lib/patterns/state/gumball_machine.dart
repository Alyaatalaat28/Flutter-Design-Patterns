import 'state.dart';

class GumballMachine {
  late State soldOutState;
  late State noQuarterState;
  late State hasQuarterState;
  late State soldState;
  late State currentState; // Use late to defer initialization
  int count;
  StringBuffer log = StringBuffer();

  GumballMachine({required this.count}) {
    // Initialize states in the constructor body
    soldOutState = SoldOutState(this);
    noQuarterState = NoQuarterState(this);
    hasQuarterState = HasQuarterState(this);
    soldState = SoldState(this);
    // Set initial state based on count
    currentState = count > 0 ? noQuarterState : soldOutState;
  }

  void insertQuarter() {
    log.writeln("Action: Insert Quarter");
    currentState.insertQuarter();
  }

  void ejectQuarter() {
    log.writeln("Action: Eject Quarter");
    currentState.ejectQuarter();
  }

  void turnCrank() {
    log.writeln("Action: Turn Crank");
    currentState.turnCrank();
  }

  void dispense() {
    log.writeln("Action: Dispense");
    currentState.dispense();
  }

  void releaseBall() {
    print("A gumball comes rolling out the slot...");
    if (count > 0) {
      count--;
    }
  }

  void setState(State state) {
    currentState = state;
    log.writeln("State changed to: ${state.runtimeType}");
  }

  String getStatus() =>
      "Gumball Machine\nState: ${currentState.runtimeType}\nGumballs: $count";
  String getLog() => log.toString();
}
