import 'package:flutter/material.dart';
import 'menu_component.dart';

class CompositeScreen extends StatefulWidget {
  const CompositeScreen({super.key});

  @override
  _CompositeScreenState createState() => _CompositeScreenState();
}

class _CompositeScreenState extends State<CompositeScreen> {
  bool _vegetarianOnly = false;
  late MenuComponent _allMenus;

  @override
  void initState() {
    super.initState();
    // Create menu hierarchy
    Menu pancakeHouseMenu = Menu(
      name: "Pancake House Menu",
      description: "Breakfast",
    );
    Menu dinerMenu = Menu(
      name: "Diner Menu",
      description: "Lunch",
    );
    Menu dessertMenu = Menu(
      name: "Dessert Menu",
      description: "Dessert of course!",
    );
    Menu allMenus = Menu(
      name: "All Menus",
      description: "All menus combined",
    );

    // Add menus to top-level menu
    allMenus.add(pancakeHouseMenu);
    allMenus.add(dinerMenu);
    allMenus.add(dessertMenu);

    // Add items to PancakeHouseMenu
    pancakeHouseMenu.add(MenuItem(
      name: "Regular Pancake Breakfast",
      description: "Pancakes with fried eggs, sausage",
      vegetarian: false,
      price: 2.99,
    ));
    pancakeHouseMenu.add(MenuItem(
      name: "Blueberry Pancakes",
      description: "Pancakes made with fresh blueberries",
      vegetarian: true,
      price: 3.49,
    ));

    // Add items to DinerMenu
    dinerMenu.add(MenuItem(
      name: "Vegetarian BLT",
      description: "Fakin' Bacon with lettuce & tomato on whole wheat",
      vegetarian: true,
      price: 2.99,
    ));
    dinerMenu.add(MenuItem(
      name: "Hotdog",
      description: "A hot dog with sauerkraut, relish, onions",
      vegetarian: false,
      price: 3.05,
    ));

    // Add items to DessertMenu
    dessertMenu.add(MenuItem(
      name: "Apple Pie",
      description: "Apple pie with a flakey crust",
      vegetarian: true,
      price: 1.59,
    ));

    _allMenus = allMenus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Composite Pattern - Menus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu Hierarchy',
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
              child: SingleChildScrollView(
                child: _buildMenuTree(_allMenus, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTree(MenuComponent component, int depth) {
    if (component is MenuItem && _vegetarianOnly && !component.isVegetarian()) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(left: depth * 16.0),
      child: ExpansionTile(
        title: Text(component.getName()),
        subtitle: component is MenuItem
            ? Text(
                "\$${component.getPrice().toStringAsFixed(2)}${component.isVegetarian() ? ' (Vegetarian)' : ''}",
              )
            : Text(component.getDescription()),
        children: component.getChildren().map((child) {
          return _buildMenuTree(child, depth + 1);
        }).toList(),
      ),
    );
  }
}