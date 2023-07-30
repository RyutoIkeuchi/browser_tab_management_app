import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

final ogpDataProvider =
    StateNotifierProvider<OgpDataNotifier, AsyncValue<dynamic>>(
        (ref) => OgpDataNotifier());

class OgpDataNotifier extends StateNotifier<AsyncValue<dynamic>> {
  OgpDataNotifier() : super(AsyncData(INITIAL_OGP_DATA));

  getOgpData(inputUrl) async {
    final response = await MetadataFetch.extract(inputUrl);
    state = AsyncData(response);
  }
}

final INITIAL_OGP_DATA = {
  "image": "",
  "title": "",
  "description": "",
};
