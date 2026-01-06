# 🧭 Turbo Routing

[![Pub Version](https://img.shields.io/pub/v/turbo_routing?logo=dart&label=turbo_routing)](https://pub.dev/packages/turbo_routing)
[![License: BSD-3-Clause](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![GitHub Stars](https://img.shields.io/github/stars/appboypov/turbo_routing?style=social)](https://github.com/appboypov/turbo_routing)

**Turbo Routing** is a routing abstraction layer over `go_router` for Flutter applications. It provides a clean, type-safe interface for navigation with support for custom transitions, route arguments, and navigation state management.

## Features

- **GoRouter Integration**: Built on top of the powerful `go_router` package
- **Type-Safe Navigation**: Strongly typed route arguments and return values
- **Custom Transitions**: Support for platform, custom, and modal page transitions
- **Navigation Abstraction**: Clean API for common navigation operations (push, pop, go, replace)
- **Context-Agnostic**: Works with BuildContext or NavigatorKey

## Installation

Add `turbo_routing` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  turbo_routing: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:turbo_routing/turbo_routing.dart';

// Extend TurboRouterService to create your router
class MyRouterService extends TurboRouterService {
  @override
  GoRouter get router => _router;
  
  @override
  GlobalKey<NavigatorState> get rootNavigatorKey => _navigatorKey;
  
  @override
  void onRouteChanged({String? location}) {
    log.info('Route changed to: $location');
  }
  
  // Implement your routes...
}

// Use TurboBaseNavigation for navigation
class MyNavigation extends TurboBaseNavigation {
  @override
  String get root => '/';
  
  void navigateToHome() {
    go(location: '/home');
  }
}
```

## Example

Check the `/example` directory for a complete Flutter application demonstrating Turbo Routing features.

## Contributing

Contributions are welcome! Please open issues or pull requests on our [GitHub repository](https://github.com/appboypov/turbo_routing).

## License

This package is licensed under the BSD 3-Clause License. See the [LICENSE](LICENSE) file for details.
