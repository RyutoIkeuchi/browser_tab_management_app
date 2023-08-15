import 'dart:convert';

import 'package:browser_tab_management_app/components/input_register_url_form.dart';
import 'package:browser_tab_management_app/provider/ability_list_position.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/edit_ability_modal.dart';
import '../components/preview_register_ogp_data.dart';
import '../provider/ogp_data.dart';

class RegisterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abilityListPosition = ref.watch(abilityListPositionProvider);
    return Expanded(
        child: Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
            onTap: () =>
                ref.read(abilityListPositionProvider.notifier).closeModal(),
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
          child:
              abilityListPosition["is_open_modal"] ? EditAbilityModal() : null,
        )
      ],
    ));
  }
}
