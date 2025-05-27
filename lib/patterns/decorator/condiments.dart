import 'beverage.dart';

// Mocha Decorator
class Mocha extends CondimentDecorator {
  Mocha(Beverage beverage) : super(beverage);

  @override
  String getDescription() => "${beverage.getDescription()}, Mocha";

  @override
  double cost() => beverage.cost() + 0.20;
}

// Soy Decorator
class Soy extends CondimentDecorator {
  Soy(Beverage beverage) : super(beverage);

  @override
  String getDescription() => "${beverage.getDescription()}, Soy";

  @override
  double cost() => beverage.cost() + 0.15;
}

// Whip Decorator
class Whip extends CondimentDecorator {
  Whip(Beverage beverage) : super(beverage);

  @override
  String getDescription() => "${beverage.getDescription()}, Whip";

  @override
  double cost() => beverage.cost() + 0.10;
}