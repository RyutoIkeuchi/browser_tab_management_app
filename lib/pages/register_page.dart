import 'dart:convert';

import 'package:browser_tab_management_app/components/input_register_url_form.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/preview_register_ogp_data.dart';
import '../provider/ogp_data.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
          color: Theme.of(context).highlightColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const InputRegisterUrlForm(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                child: const PreviewRegisterOgpData(),
              ),
            ]),
          )),
    );
  }
}
