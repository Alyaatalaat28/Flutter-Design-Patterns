import 'beverage.dart';

// Concrete Beverage: Espresso
class Espresso extends Beverage {
  Espresso() {
    description = "Espresso";
  }

  @override
  String getDescription() => description;

  @override
  double cost() => 1.99;
}

// Concrete Beverage: DarkRoast
class DarkRoast extends Beverage {
  DarkRoast() {
    description = "Dark Roast Coffee";
  }

  @override
  String getDescription() => description;

  @override
  double cost() => 0.99;
}

// Concrete Beverage: HouseBlend
class HouseBlend extends Beverage {
  HouseBlend() {
    description = "House Blend Coffee";
  }

  @override
  String getDescription() => description;

  @override
  double cost() => 0.89;
}