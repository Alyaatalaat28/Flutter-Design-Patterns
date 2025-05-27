// Abstract Duck class
import 'package:flutter_design_patterns/patterns/strategy/behaviors.dart';

abstract class Duck {
  FlyBehavior flyBehavior;
  QuackBehavior quackBehavior;
  Duck(this.flyBehavior, this.quackBehavior);

  String performFly() => flyBehavior.fly();
  String performQuack() => quackBehavior.quack();
  String display(); // To be implemented by subclasses

// Allow dynamic behavior change
  void setFlyBehavior(FlyBehavior fb) {
    flyBehavior = fb;
  }

  void setQuackBehavior(QuackBehavior qb) {
    quackBehavior = qb;
  }
}

// Concrete Duck classes
class MallardDuck extends Duck {
  MallardDuck() : super(FlyWithWings(), Quack());

  @override
  String display() => "I'm a Mallard Duck";
}

class RubberDuck extends Duck {
  RubberDuck() : super(FlyNoWay(), Squeak());

  @override
  String display() => "I'm a Rubber Duck";
}

class DecoyDuck extends Duck {
  DecoyDuck() : super(FlyNoWay(), MuteQuack());

  @override
  String display() => "I'm a Decoy Duck";
}
