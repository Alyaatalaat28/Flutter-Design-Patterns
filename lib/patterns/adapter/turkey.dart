import 'duck.dart';

// Turkey interface
abstract class Turkey {
  String gobble();
  String fly();
}

// Concrete Turkey: WildTurkey
class WildTurkey implements Turkey {
  @override
  String gobble() => "Gobble gobble!";

  @override
  String fly() => "I'm flying a short distance like a turkey!";
}

// Adapter to make Turkey act like Duck
class TurkeyAdapter implements Duck {
  final Turkey turkey;

  TurkeyAdapter(this.turkey);

  @override
  String quack() => turkey.gobble(); // Adapt gobble to quack

  @override
  String fly() {
    // Turkeys fly shorter distances, so simulate duck-like flying
    return "${turkey.fly()} (adapted to duck-like flying)";
  }
}
