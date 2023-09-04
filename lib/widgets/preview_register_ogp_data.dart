import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/dummys/main_property_list.dart';
import '../providers/sub_property_modal_position.dart';
import '../providers/registration_url_data.dart';
import '../providers/widget_global_key.dart';

class PreviewRegisterOgpData extends ConsumerStatefulWidget {
  const PreviewRegisterOgpData({Key? key}) : super(key: key);

  @override
  _PreviewRegisterOgpDataState createState() => _PreviewRegisterOgpDataState();
}

class _PreviewRegisterOgpDataState
    extends ConsumerState<PreviewRegisterOgpData> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey subPropertyKey = ref.watch(subPropertyWidgetKeyProvider);
    final Map<String, dynamic> registrationURLData =
        ref.watch(registrationURLDataProvider);

    return Container(
        width: 600,
        height: 600,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 2,
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Theme.of(context).shadowColor))),
                padding: const EdgeInsets.all(8),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('キャンセル')),
                      TextButton(onPressed: () {}, child: const Text('保存する'))
                    ]),
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: registrationURLData["image"] != ""
                    ? Image.network(registrationURLData["image"],
                        fit: BoxFit.cover)
                    : ColoredBox(
                        color: Theme.of(context).highlightColor,
                        child: const Center(child: Text('サムネイル')),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          registrationURLData["title"],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          registrationURLData["description"],
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                        ),
                      ),
                      Divider(
                        thickness: 0.1,
                        endIndent: 20,
                        color: Theme.of(context).shadowColor,
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 10, left: 10),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                            items: DUMMY_MAIN_PROPERTY_LIST
                                .map(
                                  (d) => DropdownMenuItem(
                                    value: d['name'],
                                    child: Text(d["name"]),
                                  ),
                                )
                                .toList(),
                            value: null,
                            hint: Text('選択してください'),
                            onChanged: (value) {},
                          ))),
                      OutlinedButton(
                        key: subPropertyKey,
                        onPressed: () {
                          ref
                              .read(subPropertyModalPositionProvider.notifier)
                              .openModal(ref);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey[100]),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none)),
                        child: Container(
                          height: 38,
                          padding: const EdgeInsets.all(6),
                          child: Row(
                              children: registrationURLData["sub_property_list"]
                                  .map<Widget>((e) => Container(
                                        margin: const EdgeInsets.only(right: 6),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color:
                                                Theme.of(context).focusColor),
                                        child: Text(
                                          e["name"],
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor),
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
