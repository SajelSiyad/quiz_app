import 'package:flutter_riverpod/flutter_riverpod.dart';

final isOptionSelectedProvider = StateProvider<bool>((ref) {
  return false;
});
final selectedButtonIndex = StateProvider((ref) => -1);

final questionIndex = StateProvider((ref) => 0);

final timerProvider = StateProvider((ref) => 60);
