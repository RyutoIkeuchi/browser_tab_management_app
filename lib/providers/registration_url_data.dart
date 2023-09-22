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
      "url": inputUrl,
      "main_property": null,
      "sub_property_list": []
    };
    state = newStateFromOgpData;
  }

  void selectMainProperty(mainProperty) {
    state = {...state, "main_property": mainProperty};
  }

  void addSubProperty(newSubProperty) {
    final List<Map<String, dynamic>> updateSubProperty = [
      ...state["sub_property_list"],
      newSubProperty
    ];
    state = {...state, "sub_property_list": updateSubProperty};
  }

  void removeTargetSubProperty(subPropertyId) {
    final List<Map<String, dynamic>> updateSubProperty =
        state["sub_property_list"]
            .where((item) => item["id"] != subPropertyId)
            .toList();
    state = {...state, "sub_property_list": updateSubProperty};
  }

  void reset() {
    state = INITIAL_URL_DATA;
  }
}

final Map<String, dynamic> INITIAL_URL_DATA = {
  "title": "ここにタイトルが入ります",
  "description": "ここにブラウザの詳細情報が入ります。",
  "image": "",
  "url": "",
  "main_property": null,
  "sub_property_list": [],
};
