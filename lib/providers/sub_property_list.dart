import 'package:browser_tab_management_app/constants/dummys/sub_property_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subPropertyListProvider =
    StateNotifierProvider<SubPropertyListNotifier, List<Map<String, dynamic>>>(
        (ref) => SubPropertyListNotifier());

class SubPropertyListNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  SubPropertyListNotifier() : super(DUMMY_SUB_PROPERTY_LIST);

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
