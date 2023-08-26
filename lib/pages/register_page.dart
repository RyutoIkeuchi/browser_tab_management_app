import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/edit_sub_property_modal.dart';
import '../widgets/input_register_url_form.dart';
import '../widgets/preview_register_ogp_data.dart';
import '../providers/sub_property_modal_position.dart';
import '../providers/registration_url_data.dart';

class RegisterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subPropertyListPosition = ref.watch(subPropertyModalPositionProvider);
    return Expanded(
        child: Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
            onTap: () => ref
                .read(subPropertyModalPositionProvider.notifier)
                .closeModal(),
            child: ColoredBox(
              color: Theme.of(context).highlightColor,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const InputRegisterUrlForm(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: const PreviewRegisterOgpData(),
                  ),
                ]),
              ),
            )),
        Container(
          child: subPropertyListPosition["is_open_modal"]
              ? EditSubPropertyModal()
              : null,
        )
      ],
    ));
  }
}
