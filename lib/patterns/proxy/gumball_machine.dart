// State interface
abstract class State {
  void insertQuarter();
  void ejectQuarter();
  void turnCrank();
  void dispense();
}

// NoQuarterState
class NoQuarterState implements State {
  final GumballMachine gumballMachine;

  NoQuarterState(this.gumballMachine);

  @override
  void insertQuarter() {
    gumballMachine.log.writeln("You inserted a quarter");
    gumballMachine.setState(gumballMachine.hasQuarterState);
  }

  @override
  void ejectQuarter() {
    gumballMachine.log.writeln("You haven't inserted a quarter");
  }

  @override
  void turnCrank() {
    gumballMachine.log.writeln("You turned, but there's no quarter");
  }

  @override
  void dispense() {
    gumballMachine.log.writeln("You need to pay first");
  }
}

// HasQuarterState
class HasQuarterState implements State {
  final GumballMachine gumballMachine;

  HasQuarterState(this.gumballMachine);

  @override
  void insertQuarter() {
    gumballMachine.log.writeln("You can't insert another quarter");
  }

  @override
  void ejectQuarter() {
    gumballMachine.log.writeln("Quarter returned");
    gumballMachine.setState(gumballMachine.noQuarterState);
  }

  @override
  void turnCrank() {
    gumballMachine.log.writeln("You turned...");
    gumballMachine.setState(gumballMachine.soldState);
    gumballMachine.dispense();
  }

  @override
  void dispense() {
    gumballMachine.log.writeln("No gumball dispensed");
  }
}

// SoldState
class SoldState implements State {
  final GumballMachine gumballMachine;

  SoldState(this.gumballMachine);

  @override
  void insertQuarter() {
    gumballMachine.log
        .writeln("Please wait, we're already giving you a gumball");
  }

  @override
  void ejectQuarter() {
    gumballMachine.log.writeln("Sorry, you already turned the crank");
  }

  @override
  void turnCrank() {
    gumballMachine.log
        .writeln("Turning twice doesn't get you another gumball!");
  }

  @override
  void dispense() {
    gumballMachine.releaseBall();
    if (gumballMachine.count > 0) {
      gumballMachine.setState(gumballMachine.noQuarterState);
    } else {
      gumballMachine.log.writeln("Oops, out of gumballs!");
      gumballMachine.setState(gumballMachine.soldOutState);
    }
  }
}

// SoldOutState
class SoldOutState implements State {
  final GumballMachine gumballMachine;

  SoldOutState(this.gumballMachine);

  @override
  void insertQuarter() {
    gumballMachine.log
        .writeln("You can't insert a quarter, the machine is sold out");
  }

  @override
  void ejectQuarter() {
    gumballMachine.log
        .writeln("You can't eject, you haven't inserted a quarter yet");
  }

  @override
  void turnCrank() {
    gumballMachine.log.writeln("You turned, but there are no gumballs");
  }

  @override
  void dispense() {
    gumballMachine.log.writeln("No gumball dispensed");
  }
}

// GumballMachine class (real subject)
class GumballMachine {
  late State soldOutState;
  late State noQuarterState;
  late State hasQuarterState;
  late State soldState;
  late State currentState;
  int count;
  final String location;
  StringBuffer log = StringBuffer();

  GumballMachine({required this.count, required this.location}) {
    soldOutState = SoldOutState(this);
    noQuarterState = NoQuarterState(this);
    hasQuarterState = HasQuarterState(this);
    soldState = SoldState(this);
    currentState = count > 0 ? noQuarterState : soldOutState;
  }

  void insertQuarter() => currentState.insertQuarter();
  void ejectQuarter() => currentState.ejectQuarter();
  void turnCrank() => currentState.turnCrank();
  void dispense() => currentState.dispense();

  void releaseBall() {
    log.writeln("A gumball comes rolling out the slot...");
    if (count > 0) {
      count--;
    }
  }

  void setState(State state) {
    currentState = state;
    log.writeln("State changed to: ${state.runtimeType}");
  }

  int getCount() => count;
  String getLocation() => location;
  String getState() => currentState.runtimeType.toString();
  String getLog() => log.toString();
}
