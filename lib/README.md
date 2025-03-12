# 🏗 Clean Architecture in Flutter

This project follows **Clean Architecture** principles to ensure a **scalable, maintainable, and testable** codebase. It is designed for **high performance and modular development**, making it easier to extend and manage features efficiently.

---

## 📂 Project Structure

```
├── lib
│   ├── core                # Core utilities (constants, helpers, theme, etc.)
│   ├── data                # Data layer (repositories, data sources, models)
│   ├── domain              # Domain layer (use cases, entities, repository interfaces)
│   ├── presentation        # UI layer (widgets, screens, state management)
│   ├── main.dart           # Entry point of the application
```

---

## 🎯 Clean Architecture Layers

This project is structured based on **Uncle Bob's Clean Architecture** principles:

1. **Presentation Layer (UI)**
   - Contains `Widgets`, `Screens`, and `Controllers` (e.g., Bloc, Provider, or Riverpod).
   - Handles user interactions and state management.

2. **Domain Layer (Business Logic)**
   - Defines `Use Cases`, `Repositories (Interfaces)`, and `Entities`.
   - This layer is independent of external dependencies.

3. **Data Layer (Repository Implementation)**
   - Implements the repositories defined in the domain.
   - Fetches and stores data using APIs, local databases, or remote servers.

---

## 🚀 Features

- **Modular structure** for easy scalability.
- **State Management** (Provider).
- **Centralized Routing** for navigation.
- **Repository Pattern** to separate data sources.
- **Theming & Localization** support.

---

## 📦 Dependencies Used

| Package              | Purpose                           |
|----------------------|-----------------------------------|
| `provider`           | State management                  |
| `flutter_routes`     | Navigation management             |
| `http`               | API requests handling             |
| `shared_preferences` | Local database storage            |

---

## 🛠️ How to Run the Project

### Step 1: Clone the Repository
```sh
git clone -b r2win_waqarul https://github.com/Gravityclasses123/GravityClassesApp9.8.git
```

### Step 2: Navigate to the Project Directory
```sh
cd GravityClassesApp9.8
```

### Step 3: Install Dependencies
```sh
flutter pub get
```

### Step 4: Run the App
```sh
flutter run
```

---
