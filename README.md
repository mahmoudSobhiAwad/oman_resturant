# Oman Restaurant

Welcome to the **Oman Restaurant** mobile application! 

This app is designed to provide a premium and seamless food browsing and ordering experience for users. Built with Flutter, it boasts an elegant interface, robust state management, and modern architectural patterns conforming to Clean Architecture.

## Features ✨

- **Eye-Catching UI/UX**: Elegant, dark/light themed layouts with a modern design system.
- **Dynamic & Responsive Text**: Typography that scales responsively across different screen sizes.
- **Advanced Animations**: Hero transitions, scale transitions, fade transitions, and shimmer loading layouts (using `LiquidShimmerBox`).
- **State Management**: Built primarily with **BloC/Cubit** for predictable and efficient UI state updates.
- **Routing**: Handled efficiently with `go_router`, with type-safe route argument passing (e.g., `MealDetailsPassParam`).
- **Clean Architecture**: Separation of concerns across Presentation, Domain, and Data layers. Dependency injection managed via `get_it`.
- **Custom Overlays & Views**: Custom customizable dialogs, beautiful bottom sheets, dynamic SnackBar/Toast notifications natively constructed to look gorgeous.
- **Offline Capabilities & Caching**: Custom Cached Images to quickly load network pictures without repeating heavy payload requests.

## Project Structure 📁

The project generally follows a feature-centric structure inside the `lib/` directory:

```plaintext
lib/
├── core/
│   ├── animation/             # Custom transition animations
│   ├── dependency_injection/  # get_it service locator setup
│   ├── enums/                 # Application-wide enumerations
│   ├── routing/               # go_router configuration
│   └── utils/                 # Utilities, themes, extensions, UI tokens
├── features/
│   ├── app_layout/            # Main structural app layout
│   └── meal/                  # Specific meal browsing, listing & details
├── shared/
│   ├── shimmer/               # Global skeleton loaders
│   └── widgets/               # Reusable atomic UI elements
└── main.dart                  # Application entry point
```


