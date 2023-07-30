import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/preview_register_ogp_data.dart';

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
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).cardColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      labelText: "URLを入力"),
                ),
              ),
              TextButton(
                  onPressed: handleGetThumbnailFromWeb,
                  child: Text('webサイトのmetaデータを取得')),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: PreviewRegisterOgpData(),
              )
            ]),
          )),
    );
  }
}
