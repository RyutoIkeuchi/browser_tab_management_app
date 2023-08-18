import 'package:flutter_riverpod/flutter_riverpod.dart';

final abilityListProvider =
    StateNotifierProvider<AbilityListNotifier, List<Map<String, dynamic>>>(
        (ref) => AbilityListNotifier());

class AbilityListNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  AbilityListNotifier() : super(INITIAL_ABILITY_LIST_DATA);

  void add(targetAbility) {
    state = [...state, targetAbility];
    state.sort((a, b) => a["id"].compareTo(b["id"]));
  }

  void remove(abilityId) {
    final List<Map<String, dynamic>> updateAbilityList =
        state.where((item) => item["id"] != abilityId).toList();
    state = updateAbilityList;
  }
}

List<Map<String, dynamic>> INITIAL_ABILITY_LIST_DATA = [
  {"id": 1, "name": "Hello"},
  {"id": 2, "name": "World"},
  {"id": 3, "name": "!!!!!!!!!"},
  {"id": 4, "name": "Flutter"},
  {"id": 5, "name": "React"},
  {"id": 6, "name": "HTML"},
  {"id": 7, "name": "Python"},
];
