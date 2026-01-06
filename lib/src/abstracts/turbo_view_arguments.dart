import '../models/turbo_extra_arguments.dart';

abstract class TurboViewArguments {
  Map<String, dynamic> toMap();
}

extension TurboViewArgumentsListExtension on List<TurboViewArguments> {
  TurboExtraArguments get toExtraArguments {
    final extraArguments = <String, dynamic>{};
    for (final viewArguments in this) {
      extraArguments.addAll(viewArguments.toMap());
    }
    return TurboExtraArguments.fromMap(extraArguments);
  }
}
