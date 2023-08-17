import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/ability_modal_position.dart';
import '../provider/registration_url_data.dart';

class EditAbilityModal extends ConsumerWidget {
  final List<Map<String, dynamic>> DUMMY_ABILITY_SUGGEST_LIST = [
    {"id": 4, "name": "Flutter"},
    {"id": 5, "name": "React"},
    {"id": 6, "name": "HTML"},
    {"id": 7, "name": "Python"},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abilityListPosition = ref.watch(abilityModalPositionProvider);
    final registrationURLData = ref.watch(registrationURLDataProvider);

    return Positioned(
        top: abilityListPosition["top"],
        left: abilityListPosition["left"],
        width: abilityListPosition["width"],
        height: 250,
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
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: registrationURLData.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (stack, err) => const Center(child: Text('エラーです')),
                      data: (data) {
                        return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data["ability_list"]
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
                                              color:
                                                  Theme.of(context).hintColor),
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            color: Theme.of(context).hintColor,
                                            iconSize: 16,
                                            onPressed: () {},
                                            icon: const Icon(Icons.close))
                                      ],
                                    )))
                                .toList());
                      }),
                ),
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
                  children: DUMMY_ABILITY_SUGGEST_LIST.map((d) {
                    return TextButton(
                      onPressed: () {
                        print(d);
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
