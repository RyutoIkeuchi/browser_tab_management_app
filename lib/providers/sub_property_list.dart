import 'package:flutter_riverpod/flutter_riverpod.dart';

final subPropertyListProvider =
    StateNotifierProvider<SubPropertyListNotifier, List<Map<String, dynamic>>>(
        (ref) => SubPropertyListNotifier());

class SubPropertyListNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  SubPropertyListNotifier() : super(INITIAL_SUB_PROPERTY_LIST);

  void add(targetSubProperty) {
    state = [...state, targetSubProperty];
    state.sort((a, b) => a["id"].compareTo(b["id"]));
  }

  void remove(subPropertyId) {
    final List<Map<String, dynamic>> updateSubPropertyList =
        state.where((item) => item["id"] != subPropertyId).toList();
    state = updateSubPropertyList;
  }
}

List<Map<String, dynamic>> INITIAL_SUB_PROPERTY_LIST = [
  {"id": 1, "name": "Hello"},
  {"id": 2, "name": "World"},
  {"id": 3, "name": "!!!!!!!!!"},
  {"id": 4, "name": "Flutter"},
  {"id": 5, "name": "React"},
  {"id": 6, "name": "HTML"},
  {"id": 7, "name": "Python"},
];
