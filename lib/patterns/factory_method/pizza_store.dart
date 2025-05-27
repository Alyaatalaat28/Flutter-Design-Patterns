import 'pizza.dart';

// Abstract PizzaStore class with Factory Method
abstract class PizzaStore {
  Pizza createPizza(String type); // Factory Method

  String orderPizza(String type) {
    Pizza pizza = createPizza(type);
    StringBuffer output = StringBuffer();
    output.writeln("--- Ordering ${pizza.getName()} ---");
    output.writeln(pizza.prepare());
    output.writeln(pizza.bake());
    output.writeln(pizza.cut());
    output.writeln(pizza.box());
    output.writeln(pizza.getDetails());
    return output.toString();
  }
}

// Concrete Store: NYStylePizzaStore
class NYStylePizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    switch (type) {
      case 'cheese':
        return NYStyleCheesePizza();
      case 'veggie':
        return NYStyleVeggiePizza();
      default:
        throw Exception("Unknown pizza type: $type");
    }
  }
}

// Concrete Store: ChicagoStylePizzaStore
class ChicagoStylePizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    switch (type) {
      case 'cheese':
        return ChicagoStyleCheesePizza();
      case 'veggie':
        return ChicagoStyleVeggiePizza();
      default:
        throw Exception("Unknown pizza type: $type");
    }
  }
}