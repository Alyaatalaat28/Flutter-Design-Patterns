// Iterator interface
abstract class Iterator<T> {
  bool hasNext();
  T next();
}

// MenuItem class
class MenuItem {
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

  String getDetails() =>
      "$name (\$${price.toStringAsFixed(2)})\n$description${vegetarian ? ' (Vegetarian)' : ''}";
}