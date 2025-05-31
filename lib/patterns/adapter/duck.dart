// Duck interface
abstract class Duck {
  String quack();
  String fly();
}

// Concrete Duck: MallardDuck
class MallardDuck implements Duck {
  @override
  String quack() => "Quack!";

  @override
  String fly() => "I'm flying like a duck!";
}
