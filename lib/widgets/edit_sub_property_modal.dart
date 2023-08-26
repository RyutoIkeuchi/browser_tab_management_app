import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sub_property_list.dart';
import '../providers/registration_url_data.dart';
import '../providers/sub_property_modal_position.dart';

class EditSubPropertyModal extends ConsumerWidget {
  const EditSubPropertyModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subPropertyListPosition = ref.watch(subPropertyModalPositionProvider);
    final registrationURLData = ref.watch(registrationURLDataProvider);
    final subPropertyList = ref.watch(subPropertyListProvider);

    return Positioned(
        top: subPropertyListPosition["top"],
        left: subPropertyListPosition["left"],
        width: subPropertyListPosition["width"],
        height: 300,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(10, 10),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ]),
            child: Column(
              children: [
                Container(
                    height: 38,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: registrationURLData["sub_property_list"]
                            .map<Widget>((e) => Container(
                                margin: const EdgeInsets.only(right: 6),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context).focusColor),
                                child: Row(
                                  children: [
                                    Text(
                                      e["name"],
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        color: Theme.of(context).hintColor,
                                        iconSize: 16,
                                        onPressed: () {
                                          ref
                                              .read(registrationURLDataProvider
                                                  .notifier)
                                              .removeTargetSubProperty(e['id']);
                                          ref
                                              .read(
                                                  subPropertyListProvider.notifier)
                                              .add(e);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                )))
                            .toList())),
                const Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'オプションを選択するか、新しく作成する',
                        style: TextStyle(fontSize: 12),
                      ),
                    )),
                Column(
                  children: subPropertyList.map((d) {
                    return TextButton(
                      onPressed: () {
                        ref
                            .read(registrationURLDataProvider.notifier)
                            .addSubProperty(d);
                        ref.read(subPropertyListProvider.notifier).remove(d["id"]);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, left: 8, right: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.subject,
                                  size: 16,
                                ),
                              ),
                              Text(d['name']),
                            ]),
                      ),
                    );
                  }).toList(),
                )
              ],
            )));
  }
}
