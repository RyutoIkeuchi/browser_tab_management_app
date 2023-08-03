import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/preview_register_ogp_data.dart';
import '../provider/ogp_data.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    handleGetThumbnailFromWeb() {
      ref.read(ogpDataProvider.notifier).getOgpData(_controller.text);
    }

    return Expanded(
      child: ColoredBox(
          color: Theme.of(context).highlightColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 800,
                    child: TextField(
                      controller: _controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).cardColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).cardColor)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          labelText: "URLを入力"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: handleGetThumbnailFromWeb,
                        child: const Text('metaデータを取得')),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: const PreviewRegisterOgpData(),
              ),
            ]),
          )),
    );
  }
}
