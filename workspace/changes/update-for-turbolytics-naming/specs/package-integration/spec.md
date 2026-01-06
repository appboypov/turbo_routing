# Spec: Package Integration

## MODIFIED Requirements

### Requirement: turbo_routing Uses Turbolytics
The `turbo_routing` package MUST use the `Turbolytics` mixin (renamed from `Loglytics`) for logging functionality.

#### Scenario: TurboRouterService uses Turbolytics
- **WHEN** `TurboRouterService` class is defined
- **THEN** it uses `with Turbolytics` mixin (not `with Loglytics`)
- **AND** all imports reference `package:turbolytics/turbolytics.dart`

#### Scenario: TurboBaseNavigation uses Turbolytics
- **WHEN** `TurboBaseNavigation` class is defined
- **THEN** it uses `with Turbolytics` mixin (not `with Loglytics`)
- **AND** all imports reference `package:turbolytics/turbolytics.dart`

