import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget_global_key.dart';

final subPropertyModalPositionProvider =
    StateNotifierProvider<SubPropertyModalPositionNotifier, Map<String, dynamic>>(
        (ref) => SubPropertyModalPositionNotifier());

class SubPropertyModalPositionNotifier extends StateNotifier<Map<String, dynamic>> {
  SubPropertyModalPositionNotifier() : super(INITIAL_POSITION_DATA);

  void openModal(ref) {
    final appBarGlobalKey = ref.watch(appBarGlobalKeyProvider);
    RenderBox appBarBox =
        appBarGlobalKey.currentContext!.findRenderObject() as RenderBox;

    final navigationRailGlobalKey = ref.watch(navigationRailGlobalKeyProvider);
    RenderBox navigationBox =
        navigationRailGlobalKey.currentContext!.findRenderObject() as RenderBox;

    final subPropertyGlobalKey = ref.watch(subPropertyWidgetKeyProvider);
    RenderBox box =
        subPropertyGlobalKey.currentContext!.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero);
    final updateState = {
      "top": position.dy - appBarBox.size.height,
      "left": position.dx - navigationBox.size.width,
      "width": box.size.width,
      "is_open_modal": true
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
