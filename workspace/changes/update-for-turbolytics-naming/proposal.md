# Change: Update turbo_routing to use Turbolytics

## Why
After `turbolytics` package renamed `Loglytics` to `Turbolytics`, `turbo_routing` must be updated to use the new mixin name to prevent broken imports and maintain consistency.

## What Changes
- Update `turbo_routing/lib/src/services/turbo_router_service.dart` to use `with Turbolytics` (renamed from `with Loglytics`)
- Update `turbo_routing/lib/src/abstracts/turbo_base_navigation.dart` to use `with Turbolytics` (renamed from `with Loglytics`)

## Impact
- Affected code:
  - `turbo_routing/lib/src/services/turbo_router_service.dart`
  - `turbo_routing/lib/src/abstracts/turbo_base_navigation.dart`

