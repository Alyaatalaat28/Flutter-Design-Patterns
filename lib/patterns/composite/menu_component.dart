// Abstract base class for menu components
abstract class MenuComponent {
  void add(MenuComponent menuComponent) {
    throw UnsupportedError("Cannot add to this component");
  }

  void remove(MenuComponent menuComponent) {
    throw UnsupportedError("Cannot remove from this component");
  }

  String getName();
  String getDescription();
  double getPrice();
  bool isVegetarian();
  String print({bool vegetarianOnly = false});
  List<MenuComponent> getChildren() => [];
}

// Leaf class: MenuItem
class MenuItem extends MenuComponent {
  final String name;
  final String description;
  final bool vegetarian;
  final double price;

  MenuItem({
    required this.name,
    required this.description,
    required this.vegetarian,
    required this.price,
  });

  @override
  String getName() => name;

  @override
  String getDescription() => description;

  @override
  double getPrice() => price;

  @override
  bool isVegetarian() => vegetarian;

  @override
  String print({bool vegetarianOnly = false}) {
    if (vegetarianOnly && !vegetarian) return "";
    return "$name (\$${price.toStringAsFixed(2)})\n$description${vegetarian ? ' (Vegetarian)' : ''}\n";
  }
}

// Composite class: Menu
class Menu extends MenuComponent {
  final String name;
  final String description;
  final List<MenuComponent> menuComponents = [];

  Menu({required this.name, required this.description});

  @override
  void add(MenuComponent menuComponent) {
    menuComponents.add(menuComponent);
  }

  @override
  void remove(MenuComponent menuComponent) {
    menuComponents.remove(menuComponent);
  }

  @override
  String getName() => name;

  @override
  String getDescription() => description;

  @override
  double getPrice() => 0.0; // Menus don't have prices

  @override
  bool isVegetarian() => false; // Menus aren't vegetarian

  @override
  String print({bool vegetarianOnly = false}) {
    StringBuffer buffer = StringBuffer();
    buffer.writeln("$name\n$description\n");
    for (var component in menuComponents) {
      buffer.write(component.print(vegetarianOnly: vegetarianOnly));
    }
    return buffer.toString();
  }

  @override
  List<MenuComponent> getChildren() => menuComponents;
}