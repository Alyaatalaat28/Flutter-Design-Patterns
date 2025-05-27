// Abstract Pizza class
// ignore_for_file: avoid_print

abstract class Pizza {
  String name = "Unknown Pizza";
  String dough = "";
  String sauce = "";
  List<String> toppings = [];

  String prepare() {
    return '''Preparing $name
Tossing dough: $dough
Adding sauce: $sauce
Adding toppings: ${toppings.join(", ")}''';
  }

  String bake() => "Baking for 25 minutes at 350°F";
  String cut() => "Cutting the pizza into diagonal slices";
  String box() => "Placing pizza in official PizzaStore box";

  String getName() => name;

  // For UI display
  String getDetails() => '''
Name: $name
Dough: $dough
Sauce: $sauce
Toppings: ${toppings.join(", ")}
''';
}

// Concrete Pizzas: New York Style
class NYStyleCheesePizza extends Pizza {
  NYStyleCheesePizza() {
    name = "NY Style Cheese Pizza";
    dough = "Thin Crust Dough";
    sauce = "Marinara Sauce";
    toppings.addAll(["Grated Reggiano Cheese"]);
  }
}

class NYStyleVeggiePizza extends Pizza {
  NYStyleVeggiePizza() {
    name = "NY Style Veggie Pizza";
    dough = "Thin Crust Dough";
    sauce = "Marinara Sauce";
    toppings
        .addAll(["Grated Reggiano Cheese", "Mushrooms", "Onions", "Peppers"]);
  }
}

// Concrete Pizzas: Chicago Style
class ChicagoStyleCheesePizza extends Pizza {
  ChicagoStyleCheesePizza() {
    name = "Chicago Style Cheese Pizza";
    dough = "Thick Crust Dough";
    sauce = "Plum Tomato Sauce";
    toppings.addAll(["Shredded Mozzarella Cheese"]);
  }

  @override
  String cut() => "Cutting the pizza into square slices";
}

class ChicagoStyleVeggiePizza extends Pizza {
  ChicagoStyleVeggiePizza() {
    name = "Chicago Style Veggie Pizza";
    dough = "Thick Crust Dough";
    sauce = "Plum Tomato Sauce";
    toppings.addAll(["Shredded Mozzarella Cheese", "Spinach", "Olives"]);
  }

  @override
  String cut() => "Cutting the pizza into square slices";
}
