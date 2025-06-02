// Abstract base class with template method
abstract class CaffeineBeverage {
  StringBuffer log = StringBuffer();

  // Template method defining the algorithm
  void prepareRecipe() {
    boilWater();
    brew();
    pourInCup();
    addCondiments();
  }

  // Common steps
  void boilWater() {
    log.writeln("Boiling water");
  }

  void pourInCup() {
    log.writeln("Pouring into cup");
  }

  // Abstract steps to be implemented by subclasses
  void brew();
  void addCondiments();

  String getLog() => log.toString();
  String getName();
}

// Concrete class: Coffee
class Coffee extends CaffeineBeverage {
  @override
  void brew() {
    log.writeln("Dripping coffee through filter");
  }

  @override
  void addCondiments() {
    log.writeln("Adding sugar and milk");
  }

  @override
  String getName() => "Coffee";
}

// Concrete class: Tea
class Tea extends CaffeineBeverage {
  @override
  void brew() {
    log.writeln("Steeping the tea");
  }

  @override
  void addCondiments() {
    log.writeln("Adding lemon");
  }

  @override
  String getName() => "Tea";
}