import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/dummys/main_property_list.dart';

final mainPropertyListProvider =
    StateNotifierProvider<MainPropertyListNotifier, List<Map<String, dynamic>>>(
        (ref) => MainPropertyListNotifier());

class MainPropertyListNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  MainPropertyListNotifier() : super(DUMMY_MAIN_PROPERTY_LIST);

  void add(targetSubProperty) {
    state = [...state, targetSubProperty];
    state.sort((a, b) => a["id"].compareTo(b["id"]));
  }

  void remove(subPropertyId) {
    final List<Map<String, dynamic>> updateMainPropertyList =
        state.where((item) => item["id"] != subPropertyId).toList();
    state = updateMainPropertyList;
  }
}
