import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

final registrationURLDataProvider = StateNotifierProvider<
    RegistrationURLDataNotifier,
    AsyncValue<Map<String, dynamic>>>((ref) => RegistrationURLDataNotifier());

class RegistrationURLDataNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  RegistrationURLDataNotifier() : super(AsyncData(INITIAL_URL_DATA));

  Future<void> getOgpData(inputUrl) async {
    state = const AsyncLoading();
    final Metadata? response = await MetadataFetch.extract(inputUrl);
    final Map<String, dynamic> newStateFromOgpData = {
      "title": response?.title,
      "description": response?.description,
      "image": response?.image,
      "ability_list": [
        {"id": 1, "name": "Hello"},
        {"id": 2, "name": "World"},
        {"id": 3, "name": "!!!!!!!!!"}
      ]
    };
    state = AsyncData(newStateFromOgpData);
  }
}

final Map<String, dynamic> INITIAL_URL_DATA = {
  "title": "ここにタイトルが入ります",
  "description": "ここにブラウザの詳細情報が入ります。",
  "image": "",
  "ability_list": [
    {"id": 1, "name": "Hello"},
    {"id": 2, "name": "World"},
    {"id": 3, "name": "!!!!!!!!!"}
  ],
};
