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
