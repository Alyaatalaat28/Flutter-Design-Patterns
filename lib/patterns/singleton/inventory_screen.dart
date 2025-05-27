import 'package:flutter/material.dart';
import 'coffee_shop_inventory.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // Access the Singleton instance
  final CoffeeShopInventory _inventory = CoffeeShopInventory();
  final CoffeeShopInventory _anotherInventory = CoffeeShopInventory(); // To prove same instance
  final _beansController = TextEditingController();
  final _milkController = TextEditingController();

  void _addBeans() {
    final grams = int.tryParse(_beansController.text) ?? 0;
    _inventory.addCoffeeBeans(grams);
    setState(() {});
  }

  void _useBeans() {
    final grams = int.tryParse(_beansController.text) ?? 0;
    _inventory.useCoffeeBeans(grams);
    setState(() {});
  }

  void _addMilk() {
    final ml = int.tryParse(_milkController.text) ?? 0;
    _inventory.addMilk(ml);
    setState(() {});
  }

  void _useMilk() {
    final ml = int.tryParse(_milkController.text) ?? 0;
    _inventory.useMilk(ml);
    setState(() {});
  }

  @override
  void dispose() {
    _beansController.dispose();
    _milkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Singleton Pattern - Coffee Shop Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Coffee Shop Inventory (Singleton)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Inventory Instance: ${_inventory.getInventoryStatus()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Another Instance (same): ${_anotherInventory.getInventoryStatus()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Manage Coffee Beans:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _beansController,
              decoration: const InputDecoration(labelText: 'Coffee Beans (grams)'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addBeans,
                  child: const Text('Add Beans'),
                ),
                ElevatedButton(
                  onPressed: _useBeans,
                  child: const Text('Use Beans'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Manage Milk:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _milkController,
              decoration: const InputDecoration(labelText: 'Milk (ml)'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addMilk,
                  child: const Text('Add Milk'),
                ),
                ElevatedButton(
                  onPressed: _useMilk,
                  child: const Text('Use Milk'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}