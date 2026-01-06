import '../abstracts/turbo_view_arguments.dart';

class TurboOriginArguments<Origin, Arguments extends TurboViewArguments> {
  const TurboOriginArguments({required this.origin, required this.data});

  final Origin origin;
  final Arguments data;
}
