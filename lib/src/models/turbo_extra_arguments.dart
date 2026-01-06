import 'package:go_router/go_router.dart';
import 'package:turbo_widgets/turbo_widgets.dart';

/// Generic extra arguments model for routing.
/// Projects should extend this or create their own implementation.
class TurboExtraArguments {
  const TurboExtraArguments({this.id, this.customData});

  final String? id;
  final Map<String, dynamic>? customData;

  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id, if (customData != null) ...customData!};
  }

  factory TurboExtraArguments.fromMap(Map<String, dynamic> map) {
    return TurboExtraArguments(id: map['id'] as String?, customData: map);
  }
}

extension TurboGoRouterStateExtension on GoRouterState {
  TurboExtraArguments? turboArguments() =>
      extra?.turboAsType<TurboExtraArguments>();
  String? get turboId => _turboId('id') ?? turboArguments()?.toMap()['id'];

  String? _turboId(String key) =>
      pathParameters[key] ?? uri.queryParameters[key];
}
