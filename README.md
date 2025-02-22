

# Absence Manager

The Absence Manager is a Flutter application designed to help company owners manage employee absences, including sickness and vacations. It provides features such as viewing a list of absences, filtering by type and date, pagination.

---

## Features

- **View Absences**:
  - See a list of absences with employee names, types, periods, notes, and statuses.
  - Paginate through the list (10 items per page).
  - View the total number of absences.

- **Filter Absences**:
  - Filter by absence type (e.g., sickness, vacation).
  - Filter by date range.

- **Loading and Error States**:
  - Display a loading state while fetching data.
  - Show an error state if the data is unavailable.
  - Display an empty state if there are no results.

---

## Tech Stack

- **Flutter**: The app is built using Flutter for cross-platform compatibility.
- **State Management**: BLoC (Business Logic Component) is used for state management.
- **Dependency Injection**: The `get_it` package is used for dependency injection.
- **Localization**: The app supports multiple languages using the `flutter_localizations` package.
- **API Integration**: Mock data is used using Api package (internal), but the app is designed to integrate with a backend API with minimal changes.
- **Testing**: The app includes unit, integration and and widget tests using the `flutter_test`,`bloc_test` and`mocktail` library.
- **Code Quality**: The app follows best practices, including clean code principles, consistent naming, and linting.

---

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **IDE**: Use Android Studio, IntelliJ IDEA, or VS Code with the Flutter and Dart plugins installed.

### Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/thealphamerc/absence_manager_app.git
    cd absence_manager_app
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

4. **Run Tests:**
   ```bash
   flutter test
   ```
5. **Code Coverage:**

    ```bash
    # Generate `coverage/lcov.info` file
    flutter test --coverage
    # Generate HTML report
    # Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
    genhtml coverage/lcov.info -o coverage/html
    # Open the report
    open coverage/html/index.html
    ```


## Usage

1. **Home Page**:
   - The home page displays a list of absences.
   - Use the filter icon in the app bar to open the filters dialog.
   - Apply filters by type and date range.

 - a. **Filters Dialog**:
   - Select an absence type (e.g., sickness, vacation).
   - Choose a start date and end date.
   - Click "Apply Filters" to update the list.

  - b. **Pagination**:
    - Scroll to the bottom of the list to load more absences.

2. **Setting Page**:
    - The setting page have the option to change the theme and language of the app.
    - The app supports light and dark theme.
    - The app supports English and German language.
    
---
