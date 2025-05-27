import 'package:flutter/material.dart';
import 'pizza_store.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  PizzaStore _store = NYStylePizzaStore();
  String _pizzaType = 'cheese';
  String _output = "Select a store and pizza type, then order!";

  void _updateStore(String? store) {
    setState(() {
      _store = store == 'New York' ? NYStylePizzaStore() : ChicagoStylePizzaStore();
      _output = "Selected $store store";
    });
  }

  void _updatePizzaType(String? type) {
    setState(() {
      _pizzaType = type ?? 'cheese';
      _output = "Selected $_pizzaType pizza";
    });
  }

  void _orderPizza() {
    try {
      setState(() {
        _output = _store.orderPizza(_pizzaType);
      });
    } catch (e) {
      setState(() {
        _output = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factory Method - Pizza Store')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Pizza Store:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _store is NYStylePizzaStore ? 'New York' : 'Chicago',
              items: ['New York', 'Chicago']
                  .map((store) => DropdownMenuItem<String>(
                        value: store,
                        child: Text(store),
                      ))
                  .toList(),
              onChanged: _updateStore,
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Pizza Type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _pizzaType,
              items: ['cheese', 'veggie']
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(type.capitalize()),
                      ))
                  .toList(),
              onChanged: _updatePizzaType,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _orderPizza,
              child: const Text('Order Pizza'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Order Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extension to capitalize strings
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}