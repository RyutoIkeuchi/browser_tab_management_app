import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

final registrationURLDataProvider =
    StateNotifierProvider<RegistrationURLDataNotifier, Map<String, dynamic>>(
        (ref) => RegistrationURLDataNotifier());

class RegistrationURLDataNotifier extends StateNotifier<Map<String, dynamic>> {
  RegistrationURLDataNotifier() : super(INITIAL_URL_DATA);

  Future<void> getOgpData(inputUrl) async {
    final Metadata? response = await MetadataFetch.extract(inputUrl);
    final Map<String, dynamic> newStateFromOgpData = {
      "title": response?.title,
      "description": response?.description,
      "image": response?.image,
      "ability_list": []
    };
    state = newStateFromOgpData;
  }

  void addAbility(newAbility) {
    final List<Map<String, dynamic>> updateAbilityList = [
      ...state["ability_list"],
      newAbility
    ];
    state = {...state, "ability_list": updateAbilityList};
  }

  void removeTargetAbility(abilityId) {
    final List<Map<String, dynamic>> updateAbilityList =
        state["ability_list"].where((item) => item["id"] != abilityId).toList();
    state = {...state, "ability_list": updateAbilityList};
  }
}

final Map<String, dynamic> INITIAL_URL_DATA = {
  "title": "ここにタイトルが入ります",
  "description": "ここにブラウザの詳細情報が入ります。",
  "image": "",
  "ability_list": [],
};
