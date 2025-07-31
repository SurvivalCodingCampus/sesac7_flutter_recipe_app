
# Project Structure

This document outlines the directory structure of the sesac7_flutter_recipe_app project.

```
/Users/junsuk/dev/FlutterProjects/sesac7_flutter_recipe_app/
├───.gitignore
├───.metadata
├───analysis_options.yaml
├───devtools_options.yaml
├───pubspec.lock
├───pubspec.yaml
├───README.md
├───recipe.puml
├───.dart_tool/
├───.git/
├───.github/
│   └───pull_request_template.md
├───.idea/
├───android/
│   ├───app/
│   └───gradle/
├───build/
├───integration_test/
│   └───app_test.dart
├───ios/
│   ├───Flutter/
│   ├───Pods/
│   ├───Runner/
│   └───RunnerTests/
├───lib/
│   ├───main.dart
│   ├───01_stateless/
│   │   ├───core/
│   │   ├───data/
│   │   ├───di/
│   │   ├───domain/
│   │   ├───presentation/
│   │   └───ui/
│   ├───core/
│   │   ├───domain/
│   │   └───utils/
│   └───feature/
│       ├───home/
│       ├───ingredient/
│       ├───saved_recipes/
│       ├───search_recipes/
│       └───splash/
├───test/
│   ├───01_stateless/
│   ├───core/
│   └───presentation/
└───web/
```

## Top-Level Directories and Files

- **.gitignore:** Specifies intentionally untracked files to ignore.
- **.metadata:** Tracks properties of this Flutter project.
- **analysis_options.yaml:** Configures static analysis for Dart code.
- **devtools_options.yaml:** Configures options for Dart DevTools.
- **pubspec.lock:** Records the exact versions of all dependencies.
- **pubspec.yaml:** Defines project metadata and dependencies.
- **README.md:** Contains introductory information about the project.
- **recipe.puml:** PlantUML file for generating diagrams related to recipes.
- **.dart_tool/:** Manages package dependencies and build artifacts.
- **.git/:** Contains Git version control history and configuration.
- **.github/:** Holds GitHub-specific files, like pull request templates.
- **.idea/:** Contains configuration files for the IntelliJ IDEA IDE.
- **android/:** Holds the Android-specific part of the Flutter application.
- **build/:** Stores the output of the build process.
- **docs/:** Contains project documentation.
- **integration_test/:** Holds integration tests for the application.
- **ios/:** Holds the iOS-specific part of the Flutter application.
- **lib/:** The main directory for Dart source code.
- **test/:** Contains unit and widget tests for the application.
- **web/:** Contains files for the web version of the application.

## `lib/` Directory Structure

The `lib` directory is the heart of the application, organized by feature and layer.

- **`main.dart`**: The entry point of the application.
- **`01_stateless/`**: A self-contained module, likely representing a specific feature or version of the app. It follows a clean architecture pattern:
    - **`core/`**: Shared utilities, routing, and base classes.
    - **`data/`**: Data sources, repositories, and data transfer objects (DTOs).
    - **`di/`**: Dependency injection setup.
    - **`domain/`**: Business logic, models, and use cases.
    - **`presentation/`**: UI-related logic (ViewModels, Blocs, etc.).
    - **`ui/`**: Widgets and screens.
- **`core/`**: Core utilities and domain models shared across the entire application.
- **`feature/`**: Contains different features of the application, with each feature having its own presentation layer.
