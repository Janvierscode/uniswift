# UniSwift

UniSwift is a campus delivery mobile application built for University of Zimbabwe students. It provides a seamless way to order snacks, stationery, toiletries, and small electronics and have them quickly delivered to hostels.

## Design

The UI is built according to the provided Stitch project layout (`#FF9500` primary color, Plus Jakarta Sans typography, minimal white/grey layout, responsive cards).

## Architecture

This project strictly adheres to **Clean Architecture** principles and is separated into feature-first modules.

### Layers

1.  **Presentation Layer**: 
    - **BLoC (`flutter_bloc`)**: Handles state management and complex business logic.
    - **UI (`Pages` and `Widgets`)**: Screens built with Flutter rendering mock data. State drives the UI synchronously.
2.  **Domain Layer**:
    - **Entities**: Core generic application objects (`UserEntity`, `ProductEntity`, `OrderEntity`).
    - **Use Cases**: Encapsulates specific business rules (e.g., `AddToCartUseCase`, `LoginUseCase`).
    - **Repositories (Interfaces)**: Defines the contracts for data access, isolating the Domain from external dependencies.
3.  **Data Layer**:
    - **Repositories (Implementations)**: Implements the domain contracts using mock delays to simulate network requests. Includes hard-coded mock data arrays.

### Core Libraries & Tools

-   **State**: `flutter_bloc`
-   **Dependency Injection**: `get_it` + `injectable` 
-   **Navigation**: `go_router`
-   **Models**: `freezed` + `json_serializable` (Prepared for API payload generation later on).
-   **Network**: `dio` (Scaffolded but currently bypassing in favor of mock repositories).

## Getting Started

### Prerequisites
- Flutter SDK (`^3.11.1`)
- Dart SDK

### Installation

1.  Clone the repository and install dependencies:
    ```bash
    flutter pub get
    ```
    
2.  Generate necessary files for injection, freezed models, and mapping:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
    *(Note: Run this anytime you change `@injectable` boundaries, or `.dart` definitions for Freezed models/routes).*

3.  Run the application on an emulator or physical device (Android / iOS):
    ```bash
    flutter run
    ```
    
## Testing

Unit and BLoC tests focus on verifying the core flows, such as `AuthBloc` state transitions and payload handling. Run tests using:

```bash
flutter test
```
