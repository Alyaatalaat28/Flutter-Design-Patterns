// Abstract Beverage class
abstract class Beverage {
  String description = "Unknown Beverage";

  String getDescription();
  double cost();
}

// Abstract Decorator class
abstract class CondimentDecorator extends Beverage {
  Beverage beverage;

  CondimentDecorator(this.beverage);

  @override
  String getDescription();
}