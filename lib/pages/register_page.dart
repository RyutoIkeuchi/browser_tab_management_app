import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/preview_register_ogp_data.dart';
import '../provider/ogp_data.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleGetThumbnailFromWeb() {
      ref.read(ogpDataProvider.notifier).getOgpData("https://flutter.dev");
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
                  child: const Text('webサイトのmetaデータを取得')),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: const PreviewRegisterOgpData(),
              ),
            ]),
          )),
    );
  }
}
