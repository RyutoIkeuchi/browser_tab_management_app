import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

final ogpDataProvider =
    StateNotifierProvider<OgpDataNotifier, AsyncValue<Metadata>>(
        (ref) => OgpDataNotifier());

class OgpDataNotifier extends StateNotifier<AsyncValue<Metadata>> {
  OgpDataNotifier() : super(AsyncData(initialMetadata()));

  getOgpData(inputUrl) async {
    state = const AsyncLoading();
    final Metadata? response = await MetadataFetch.extract(inputUrl);
    state = AsyncData(response as Metadata);
  }
}

Metadata initialMetadata() {
  final m = Metadata();
  m.title = "ここにタイトルが入ります";
  m.description = "ここにブラウザの詳細情報が入ります。";
  m.image = "";
  return m;
}
