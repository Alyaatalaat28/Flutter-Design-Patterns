// ignore_for_file: avoid_print

import 'gumball_machine.dart';

// State interface
abstract class State {
  void insertQuarter();
  void ejectQuarter();
  void turnCrank();
  void dispense();
}

// NoQuarterState: Waiting for a quarter
class NoQuarterState implements State {
  final GumballMachine gumballMachine;

  NoQuarterState(this.gumballMachine);

  @override
  void insertQuarter() {
    print("You inserted a quarter");
    gumballMachine.setState(gumballMachine.hasQuarterState);
  }

  @override
  void ejectQuarter() {
    print("You haven't inserted a quarter");
  }

  @override
  void turnCrank() {
    print("You turned, but there's no quarter");
  }

  @override
  void dispense() {
    print("You need to pay first");
  }
}

// HasQuarterState: Quarter inserted, ready to dispense
class HasQuarterState implements State {
  final GumballMachine gumballMachine;

  HasQuarterState(this.gumballMachine);

  @override
  void insertQuarter() {
    print("You can't insert another quarter");
  }

  @override
  void ejectQuarter() {
    print("Quarter returned");
    gumballMachine.setState(gumballMachine.noQuarterState);
  }

  @override
  void turnCrank() {
    print("You turned...");
    gumballMachine.setState(gumballMachine.soldState);
    gumballMachine.dispense();
  }

  @override
  void dispense() {
    print("No gumball dispensed");
  }
}

// SoldState: Dispensing a gumball
class SoldState implements State {
  final GumballMachine gumballMachine;

  SoldState(this.gumballMachine);

  @override
  void insertQuarter() {
    print("Please wait, we're already giving you a gumball");
  }

  @override
  void ejectQuarter() {
    print("Sorry, you already turned the crank");
  }

  @override
  void turnCrank() {
    print("Turning twice doesn't get you another gumball!");
  }

  @override
  void dispense() {
    gumballMachine.releaseBall();
    if (gumballMachine.count > 0) {
      gumballMachine.setState(gumballMachine.noQuarterState);
    } else {
      print("Oops, out of gumballs!");
      gumballMachine.setState(gumballMachine.soldOutState);
    }
  }
}

// SoldOutState: No gumballs left
class SoldOutState implements State {
  final GumballMachine gumballMachine;

  SoldOutState(this.gumballMachine);

  @override
  void insertQuarter() {
    print("You can't insert a quarter, the machine is sold out");
  }

  @override
  void ejectQuarter() {
    print("You can't eject, you haven't inserted a quarter yet");
  }

  @override
  void turnCrank() {
    print("You turned, but there are no gumballs");
  }

  @override
  void dispense() {
    print("No gumball dispensed");
  }
}
