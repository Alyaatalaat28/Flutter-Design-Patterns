// Singleton class for Coffee Shop Inventory
// ignore_for_file: avoid_print

class CoffeeShopInventory {
  // Static instance variable
  static final CoffeeShopInventory _instance = CoffeeShopInventory._internal();

  // Private constructor
  CoffeeShopInventory._internal();

  // Factory constructor to return the single instance
  factory CoffeeShopInventory() => _instance;

  // Inventory state
  int _coffeeBeans = 100; // in grams
  int _milk = 1000; // in milliliters

  // Getters
  int get coffeeBeans => _coffeeBeans;
  int get milk => _milk;

  // Methods to modify inventory
  void addCoffeeBeans(int grams) {
    if (grams > 0) {
      _coffeeBeans += grams;
      print("Added $grams grams of coffee beans. Total: $_coffeeBeans grams");
    }
  }

  void useCoffeeBeans(int grams) {
    if (grams > 0 && _coffeeBeans >= grams) {
      _coffeeBeans -= grams;
      print("Used $grams grams of coffee beans. Total: $_coffeeBeans grams");
    } else {
      print("Not enough coffee beans!");
    }
  }

  void addMilk(int ml) {
    if (ml > 0) {
      _milk += ml;
      print("Added $ml ml of milk. Total: $_milk ml");
    }
  }

  void useMilk(int ml) {
    if (ml > 0 && _milk >= ml) {
      _milk -= ml;
      print("Used $ml ml of milk. Total: $_milk ml");
    } else {
      print("Not enough milk!");
    }
  }

  // For UI display
  String getInventoryStatus() =>
      "Coffee Beans: $_coffeeBeans grams\nMilk: $_milk ml\nInstance: $hashCode";
}