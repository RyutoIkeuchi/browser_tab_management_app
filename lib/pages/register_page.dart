import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ogpDataFromInputUrlProvider = StateProvider((ref) {
  return null;
});

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? _getContent({
      dynamic document,
      String tag = 'meta',
      String attribute = 'property',
      String? property,
      String key = 'content',
    }) {
      return document
          ?.getElementsByTagName("meta")
          .cast<Element?>()
          .firstWhere(
              (element) => element?.attributes["property"] == "og:title",
              orElse: () => null)
          ?.attributes["content"];
    }

    Future handleGetThumbnailFromWeb() async {
      final url = 'https://flutter.dev';
      var data = await MetadataFetch.extract(url);

      print(data?.title);
      print(data?.image);
    }

    return Expanded(
      child: ColoredBox(
          color: Theme.of(context).highlightColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              SizedBox(
                width: 1000,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).cardColor,
                      border: const OutlineInputBorder(),
                      labelText: "URLを入力"),
                ),
              ),
              TextButton(
                  onPressed: handleGetThumbnailFromWeb,
                  child: Text('webサイトのmetaデータを取得'))
            ]),
          )),
    );
  }
}
