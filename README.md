# Flutter Design Patterns

Welcome to **Flutter Design Patterns**, a hands-on exploration of classic design patterns implemented in Flutter and Dart, inspired by the iconic book *[Head First Design Patterns](https://www.oreilly.com/library/view/head-first-design/0596007124/)* by Eric Freeman and Elisabeth Robson. This repository brings abstract design patterns to life with practical Flutter code, interactive UI demonstrations, and examples drawn from the book (e.g., ducks, weather stations, pizza stores).

Each pattern includes:
- **Dart/Flutter Implementation**: Clean, reusable code showcasing the pattern's core logic.
- **UI Demonstration** (optional): Interactive Flutter widgets to visualize the pattern in action.
- **Book-Inspired Examples**: Relatable scenarios like ducks for Strategy or weather stations for Observer.
- **Educational Commentary**: Detailed explanations via linked Medium articles.

Whether you're a Flutter developer looking to master design patterns or a student of software architecture, this project bridges theory and practice with real-world Flutter applications.

---

## Patterns Implemented

Explore the following design patterns, each implemented in Flutter with clear examples and optional UI demos:

| Pattern            | Description                                           | Path                                 | Example from Book                  |
|--------------------|-------------------------------------------------------|--------------------------------------|------------------------------------|
| **Strategy**       | Encapsulates interchangeable behaviors                | `lib/patterns/strategy/`             | Ducks with swappable behaviors     |
| **Observer**       | Notifies multiple objects of state changes            | `lib/patterns/observer/`             | Weather station and displays       |
| **Decorator**      | Adds behavior dynamically at runtime                  | `lib/patterns/decorator/`            | Pizza or coffee customization      |
| **Factory Method** | Delegates object creation to subclasses               | `lib/patterns/factory_method/`       | Pizza store factories              |
| **Singleton**      | Ensures a class has only one instance                 | `lib/patterns/singleton/`            | Chocolate boiler                   |
| **Command**        | Encapsulates actions as objects                       | `lib/patterns/command/`              | Remote control commands            |
| **Adapter**        | Converts interfaces to be compatible                  | `lib/patterns/adapter/`              | Duck and turkey adapter            |
| **Facade**         | Provides a simplified interface to a complex system   | `lib/patterns/facade/`               | Home theater system                |
| **State**          | Changes behavior based on internal state              | `lib/patterns/state/`                | Gumball machine states             |
| **Template Method**| Defines the skeleton of an algorithm                  | `lib/patterns/template_method/`      | Coffee/tea brewing process         |
| **Iterator**       | Accesses elements sequentially without exposing logic | `lib/patterns/iterator/`             | Menu items iteration               |
| **Composite**      | Treats individual objects and groups uniformly        | `lib/patterns/composite/`            | Menu and submenu structure         |

> 🚀 More patterns are being added regularly. Stay tuned!

---

## Repository Structure

Each pattern resides in its own folder under `lib/patterns/`:
- **Core Logic**: Interfaces and concrete classes implementing the pattern.
- **Example Usage**: Code demonstrating the pattern with book-inspired scenarios.
- **Flutter Widgets** (optional): Interactive UI to visualize the pattern's behavior.
- **Tests** (where applicable): Unit tests to verify functionality.

Key files:
- `lib/main.dart`: Entry point to run the app (modify to test specific patterns).
- `pubspec.yaml`: Manages dependencies for the Flutter project.

---

## Design Patterns

### 1. Decorator Pattern
- **Purpose**: Extends an object’s behavior dynamically by wrapping it with decorators that add functionality.
- **Example**: A coffee shop where users select a base beverage (e.g., Espresso, House Blend) and add condiments (e.g., Mocha, Whip) via a UI. The app calculates the total cost and updates the description dynamically, showing how decorators stack behaviors.
- **Location**: [lib/patterns/decorator/](lib/patterns/decorator/)

### 2. Factory Method Pattern
- **Purpose**: Defines an interface for creating objects, letting subclasses decide which class to instantiate.
- **Example**: A pizza store where users choose a store (New York or Chicago) and pizza type (cheese or veggie). The UI displays the preparation steps for the selected pizza, demonstrating how each store’s factory method creates region-specific pizzas.
- **Location**: [lib/patterns/factory_method/](lib/patterns/factory_method/)

### 3. Singleton Pattern
- **Purpose**: Ensures a class has only one instance and provides global access to it.
- **Example**: A coffee shop inventory manager where users add or use coffee beans and milk. The UI shows that multiple references access the same Singleton instance, updating inventory levels consistently across the app.
- **Location**: [lib/patterns/singleton/](lib/patterns/singleton/)

### 4. Command Pattern
- **Purpose**: Encapsulates requests as objects, allowing parameterization, queuing, and undoable operations.
- **Example**: A remote control for home devices (light, ceiling fan). Users press buttons to execute commands (e.g., Light On, Fan High) or undo the last action. The UI displays device states and a command log, showing command encapsulation and reversibility.
- **Location**: [lib/patterns/command/](lib/patterns/command/)

### 5. Adapter Pattern
- **Purpose**: Converts one interface into another, allowing incompatible classes to work together.
- **Example**: A duck and turkey scenario where a turkey is adapted to act like a duck. The UI lets users select a duck or an adapted turkey, triggering behaviors (quack, fly) to show how the adapter maps turkey actions to duck expectations.
- **Location**: [lib/patterns/adapter/](lib/patterns/adapter/)

### 6. Facade Pattern
- **Purpose**: Provides a simplified interface to a complex subsystem.
- **Example**: A home theater system where users watch or end a movie with a single button. The UI shows subsystem actions (e.g., projector on, DVD play) coordinated by the facade, simplifying complex operations into a unified interface.
- **Location**: [lib/patterns/facade/](lib/patterns/facade/)

### 7. State Pattern
- **Purpose**: Allows an object to change its behavior when its internal state changes, encapsulating state-specific logic.
- **Example**: A gumball machine where users insert quarters, turn the crank, or eject quarters. The UI reflects the machine’s state (e.g., NoQuarter, HasQuarter) and gumball count, showing how state transitions drive behavior.
- **Location**: [lib/patterns/state/](lib/patterns/state/)

### 8. Template Method Pattern
- **Purpose**: Defines the skeleton of an algorithm, letting subclasses customize specific steps.
- **Example**: A beverage preparation system for coffee and tea. Users select a beverage, and the UI displays the preparation steps (e.g., brewing, adding condiments), showing how the template method enforces a consistent process with customizable steps.
- **Location**: [lib/patterns/template_method/](lib/patterns/template_method/)

### 9. Iterator Pattern
- **Purpose**: Provides sequential access to a collection’s elements without exposing its internal structure.
- **Example**: A diner and pancake house menu where users view menu items. The UI uses iterators to display items from different collections (array, List), with a vegetarian filter, demonstrating uniform traversal.
- **Location**: [lib/patterns/iterator/](lib/patterns/iterator/)

### 10. Composite Pattern
- **Purpose**: Treats individual objects and compositions uniformly, forming a tree-like structure.
- **Example**: A menu hierarchy with menus (e.g., Diner, Pancake House) and items. The UI displays an expandable tree, allowing users to view the structure and filter vegetarian items, showing uniform treatment of composites and leaves.
- **Location**: [lib/patterns/composite/](lib/patterns/composite/)

### 11. Proxy Pattern
- **Purpose**: Controls access to an object, acting as a surrogate to add functionality like logging or remote access.
- **Example**: A gumball machine monitored via a proxy. The UI shows the machine’s state (location, count, state) and allows actions (insert quarter, turn crank) through the proxy, with a log of interactions demonstrating controlled access.
- **Location**: [lib/patterns/proxy/](lib/patterns/proxy/)

## Getting Started

### Prerequisites
- Flutter SDK (version 2.12.0 or higher)
- Dart SDK (included with Flutter)
- A code editor (e.g., VS Code, Android Studio)

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/Alyaatalaat28/Flutter-Design-Patterns.git
   cd flutter-design-patterns
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

### Running a Specific Pattern
To test a pattern (e.g., Strategy or Observer):
1. Open `lib/main.dart`.
2. Update the `home` property in `MyApp` to point to the pattern’s screen (e.g., `home: const DuckScreen()` for Strategy or `home: const WeatherScreen()` for Observer).
3. Run the app to interact with the UI demo.

Example for Strategy pattern:
```dart
home: const DuckScreen(), // Located in lib/patterns/strategy/duck_screen.dart
```

---

## Read the Full Article Series

Dive deeper into each pattern with detailed explanations on Medium:

**[Flutter Design Patterns Series on Medium →](https://medium.com/@alyaatalaat205)**

**What you'll find in the articles:**
- Pattern overview and real-world use cases.
- Step-by-step code walkthroughs.
- Flutter-specific insights and best practices.
- Comparisons with classic OOP implementations from *Head First Design Patterns*.

---

## Why This Project?

This repository aims to:
- **Bridge Theory and Practice**: Transform abstract design patterns into practical Flutter code.
- **Enhance Learning**: Provide interactive UI demos to make patterns tangible.
- **Empower Flutter Developers**: Help you recognize when and how to apply patterns in your apps.
- **Promote Best Practices**: Encourage clean, maintainable, and scalable architecture.

Inspired by *Head First Design Patterns*, this project adapts the book’s engaging examples (ducks, weather stations, pizza stores) to the Flutter ecosystem, making it easier to grasp and apply these concepts in mobile development.

---

## Contributing

We welcome contributions to make this repository even better! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/new-pattern`).
3. Add or improve a pattern implementation, UI demo, or test.
4. Update the README with your changes (e.g., add new pattern to the table).
5. Submit a pull request with a clear description of your contribution.

Please follow the repository’s structure and include:
- Clean, documented code.
- A UI demo (if applicable).
- A test case (if possible).
- An update to the pattern table in this README.

For major changes, open an issue first to discuss your ideas.

---

## Acknowledgments

- *Head First Design Patterns* by Eric Freeman and Elisabeth Robson for inspiring this project.
- The Flutter community for their amazing tools and resources.
- Contributors who help expand and improve this repository.

Happy coding, and enjoy exploring design patterns in Flutter!
