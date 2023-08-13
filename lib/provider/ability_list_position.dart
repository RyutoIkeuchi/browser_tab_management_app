import 'package:flutter_riverpod/flutter_riverpod.dart';

final abilityListPositionProvider =
    StateNotifierProvider<AbilityListPositionNotifier, Map<String, dynamic>>(
        (ref) => AbilityListPositionNotifier());

class AbilityListPositionNotifier extends StateNotifier<Map<String, dynamic>> {
  AbilityListPositionNotifier() : super(INITIAL_POSITION_DATA);

  void toggleOpenModalStatus() {
    final updateState = {...state, "is_open_modal": !state["is_open_modal"]};
    state = updateState;
  }
}

Map<String, dynamic> INITIAL_POSITION_DATA = {
  "top": 0,
  "left": 0,
  "width": 0,
  "is_open_modal": false
};
