import 'package:browser_tab_management_app/provider/widget_global_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final abilityListPositionProvider =
    StateNotifierProvider<AbilityListPositionNotifier, Map<String, dynamic>>(
        (ref) => AbilityListPositionNotifier());

class AbilityListPositionNotifier extends StateNotifier<Map<String, dynamic>> {
  AbilityListPositionNotifier() : super(INITIAL_POSITION_DATA);

  void toggleOpenModalStatus(ref) {
    final appBarGlobalKey = ref.watch(appBarGlobalKeyProvider);
    RenderBox appBarBox =
        appBarGlobalKey.currentContext!.findRenderObject() as RenderBox;

    final navigationRailGlobalKey = ref.watch(navigationRailGlobalKeyProvider);
    RenderBox navigationBox =
        navigationRailGlobalKey.currentContext!.findRenderObject() as RenderBox;

    final abilityGlobalKey = ref.watch(abilityWidgetGlobalKeyProvider);
    RenderBox box =
        abilityGlobalKey.currentContext!.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    final updateState = {
      "top": position.dy - appBarBox.size.height,
      "left": position.dx - navigationBox.size.width,
      "width": box.size.width,
      "is_open_modal": !state["is_open_modal"]
    };
    state = updateState;
  }

  void closeModal() {
    final updateState = {...state, "is_open_modal": false};
    state = updateState;
  }
}

Map<String, dynamic> INITIAL_POSITION_DATA = {
  "top": 0,
  "left": 0,
  "width": 0,
  "is_open_modal": false
};
