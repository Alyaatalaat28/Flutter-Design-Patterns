import 'package:flutter/material.dart';
import 'diner_menu.dart';
import 'pancake_menu.dart';
import 'iterator.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final DinerMenu _dinerMenu = DinerMenu();
  final PancakeHouseMenu _pancakeMenu = PancakeHouseMenu();
  bool _vegetarianOnly = false;

  List<MenuItem> _getMenuItems() {
    List<MenuItem> items = [];
    // Iterate DinerMenu
    var dinerIterator = _dinerMenu.createIterator();
    while (dinerIterator.hasNext()) {
      var item = dinerIterator.next();
      if (!_vegetarianOnly || item.vegetarian) {
        items.add(item);
      }
    }
    // Iterate PancakeHouseMenu
    var pancakeIterator = _pancakeMenu.createIterator();
    while (pancakeIterator.hasNext()) {
      var item = pancakeIterator.next();
      if (!_vegetarianOnly || item.vegetarian) {
        items.add(item);
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = _getMenuItems();
    return Scaffold(
      appBar: AppBar(title: const Text('Iterator Pattern - Menus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Vegetarian Only'),
              value: _vegetarianOnly,
              onChanged: (value) {
                setState(() {
                  _vegetarianOnly = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.getDetails()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}