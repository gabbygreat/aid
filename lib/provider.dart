import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchNotifier extends StateNotifier<bool> {
  SwitchNotifier(super.state);

  void toogle(bool value) => state = value;
}

final switchProvider = StateNotifierProvider<SwitchNotifier, bool>((ref) => SwitchNotifier(false));
