// FlyBehavior interface
abstract class FlyBehavior {
  String fly();
}

// Concrete Fly Behaviors
class FlyWithWings implements FlyBehavior {
  @override
  String fly() => "I'm flying with wings!";
}

class FlyNoWay implements FlyBehavior {
  @override
  String fly() => "I can't fly.";
}

// QuackBehavior interface
abstract class QuackBehavior {
  String quack();
}

// Concrete Quack Behaviors
class Quack implements QuackBehavior {
  @override
  String quack() => "Quack!";
}

class Squeak implements QuackBehavior {
  @override
  String quack() => "Squeak!";
}

class MuteQuack implements QuackBehavior {
  @override
  String quack() => "Silence...";
}
