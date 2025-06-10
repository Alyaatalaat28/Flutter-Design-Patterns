import 'package:flutter_design_patterns/patterns/iterator/diner_menu.dart';

import 'iterator.dart';

// PancakeHouseMenu class
class PancakeHouseMenu implements Menu {
  final List<MenuItem> _menuItems = [];

  PancakeHouseMenu() {
    addItem(
      name: "Regular Pancake Breakfast",
      description: "Pancakes with fried eggs, sausage",
      vegetarian: false,
      price: 2.99,
    );
    addItem(
      name: "Blueberry Pancakes",
      description: "Pancakes made with fresh blueberries",
      vegetarian: true,
      price: 3.49,
    );
    addItem(
      name: "Waffles",
      description: "Waffles with your choice of blueberries or strawberries",
      vegetarian: true,
      price: 3.59,
    );
  }

  void addItem({
    required String name,
    required String description,
    required bool vegetarian,
    required double price,
  }) {
    _menuItems.add(MenuItem(
      name: name,
      description: description,
      vegetarian: vegetarian,
      price: price,
    ));
  }

  @override
  Iterator<MenuItem> createIterator() => PancakeHouseMenuIterator(_menuItems);
}

// PancakeHouseMenuIterator
class PancakeHouseMenuIterator implements Iterator<MenuItem> {
  final List<MenuItem> _items;
  int _position = 0;

  PancakeHouseMenuIterator(this._items);

  @override
  bool hasNext() => _position < _items.length;

  @override
  MenuItem next() {
    final item = _items[_position];
    _position++;
    return item;
  }
}