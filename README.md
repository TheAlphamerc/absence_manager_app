

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
- **API Integration**: Mock data is used, but the app is designed to integrate with a backend API with minimal changes.
- **Testing**: The app includes unit, integration and and widget tests using the `flutter_test`,`bloc_test` and`mocktail` library.
- **Code Quality**: The app follows best practices, including clean code principles, consistent naming, and linting.

---

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **IDE**: Use Android Studio, IntelliJ IDEA, or VS Code with the Flutter and Dart plugins installed.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/thealphamerc/absence_manager_app.git
   cd absence-manager
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

4. **Run Tests**:
   ```bash
   flutter test
   ```
5. **Code Coverage**

    ```bash
    # Generate `coverage/lcov.info` file
    flutter test --coverage
    # Generate HTML report
    # Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
    genhtml coverage/lcov.info -o coverage/html
    # Open the report
    open coverage/html/index.html
    ```

---

## Project Structure

The project is organized as follows:

```
lib/
├── blocs/              # BLoC state management files
│   ├── absence_bloc.dart
│   ├── absence_event.dart
│   └── absence_state.dart
├── repositories/       # Data repository for fetching absences
│   └── absence_repository.dart
├── models/             # Data models (Absence, Member)
│   ├── absence.dart
│   └── member.dart
├── views/              # UI screens
│   └── home_page.dart
├── widgets/            # Reusable UI components
│   ├── absence_list.dart
│   ├── absence_list_item.dart
│   ├── filters_widget.dart
│   ├── loading_indicator.dart
│   ├── error_view.dart
│   └── empty_view.dart
└── main.dart           # App entry point
```

---

## Usage

1. **Home Page**:
   - The home page displays a list of absences.
   - Use the filter icon in the app bar to open the filters dialog.
   - Apply filters by type and date range.

2. **Filters Dialog**:
   - Select an absence type (e.g., sickness, vacation).
   - Choose a start date and end date.
   - Click "Apply Filters" to update the list.

3. **Pagination**:
   - Scroll to the bottom of the list to load more absences.

4. **iCal Export**:
   - Click the calendar icon next to an absence to generate an iCal file.

---

## Testing

The app includes unit tests and widget tests to ensure functionality and reliability.

- **Run All Tests**:
  ```bash
  flutter test
  ```

- **Run Specific Tests**:
  ```bash
  flutter test test/blocs/absence_bloc_test.dart
  ```

---

## Deployment

To deploy the app, follow these steps:

1. **Build the App**:
   - For Android:
     ```bash
     flutter build apk
     ```
   - For iOS:
     ```bash
     flutter build ios
     ```

2. **Deploy to GitHub Pages** (Optional):
   - Follow the [Flutter GitHub Pages deployment guide](https://flutter.dev/docs/deployment/web).

---

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes with clear and descriptive messages.
4. Submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Thanks to the Flutter team for the amazing framework.
- Special thanks to the BLoC library for simplifying state management.

---

For any questions or feedback, please open an issue or contact the maintainers.

--- 

This README provides a comprehensive guide for developers and users to understand, set up, and use the Absence Manager app.