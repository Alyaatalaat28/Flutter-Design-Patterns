import 'iterator.dart';

// Menu interface
abstract class Menu {
  Iterator<MenuItem> createIterator();
}

// DinerMenu class
class DinerMenu implements Menu {
  static const int maxItems = 6;
  final List<MenuItem?> _menuItems = List.filled(maxItems, null);
  int _numberOfItems = 0;

  DinerMenu() {
    addItem(
      name: "Vegetarian BLT",
      description: "Fakin' Bacon with lettuce & tomato on whole wheat",
      vegetarian: true,
      price: 2.99,
    );
    addItem(
      name: "BLT",
      description: "Bacon with lettuce & tomato on whole wheat",
      vegetarian: false,
      price: 2.99,
    );
    addItem(
      name: "Hotdog",
      description: "A hot dog with sauerkraut, relish, onions, topped with cheese",
      vegetarian: false,
      price: 3.05,
    );
  }

  void addItem({
    required String name,
    required String description,
    required bool vegetarian,
    required double price,
  }) {
    if (_numberOfItems >= maxItems) {
      print("Menu is full! Can't add more items.");
      return;
    }
    _menuItems[_numberOfItems] = MenuItem(
      name: name,
      description: description,
      vegetarian: vegetarian,
      price: price,
    );
    _numberOfItems++;
  }

  @override
  Iterator<MenuItem> createIterator() => DinerMenuIterator(_menuItems);
}

// DinerMenuIterator
class DinerMenuIterator implements Iterator<MenuItem> {
  final List<MenuItem?> _items;
  int _position = 0;

  DinerMenuIterator(this._items);

  @override
  bool hasNext() => _position < _items.length && _items[_position] != null;

  @override
  MenuItem next() {
    final item = _items[_position];
    _position++;
    return item!;
  }
}