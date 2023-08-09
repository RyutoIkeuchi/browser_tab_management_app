import 'package:browser_tab_management_app/components/edi_ability_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/register_page.dart';
import '../provider/ogp_data.dart';

class PreviewRegisterOgpData extends ConsumerStatefulWidget {
  const PreviewRegisterOgpData({Key? key}) : super(key: key);

  @override
  _PreviewRegisterOgpDataState createState() => _PreviewRegisterOgpDataState();
}

class _PreviewRegisterOgpDataState
    extends ConsumerState<PreviewRegisterOgpData> {
  final _key = GlobalKey();

  bool _isOpenAbilityModal = false;
  double abilityWidth = 0;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        abilityWidth = _key.currentContext!.size!.width;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<dynamic> ogpDataFromInputUrl = ref.watch(ogpDataProvider);

    return ogpDataFromInputUrl.when(
        loading: () => const CircularProgressIndicator(),
        error: (stack, err) => const Center(child: Text('エラーです')),
        data: (data) {
          return Container(
            width: 600,
            height: 500,
            decoration:
                BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 2,
              )
            ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).shadowColor,
                              width: 0.4))),
                  child: data.image != ""
                      ? Image.network(data.image, fit: BoxFit.cover)
                      : ColoredBox(
                          color: Theme.of(context).hintColor,
                          child: const Center(child: Text('サムネイル')),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            data?.title,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            data?.description,
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
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'アビリティ',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _isOpenAbilityModal = !_isOpenAbilityModal;
                            });
                          },
                          style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide.none)),
                          child: Container(
                            child: Stack(
                              key: _key,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(6),
                                  child: Row(children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Theme.of(context).focusColor),
                                      child: Text(
                                        'Hello',
                                        style: TextStyle(
                                            color: Theme.of(context).hintColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Theme.of(context).focusColor),
                                      child: Text(
                                        'World',
                                        style: TextStyle(
                                            color: Theme.of(context).hintColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Theme.of(context).focusColor),
                                      child: Text(
                                        '!!!!!!!!!!!',
                                        style: TextStyle(
                                            color: Theme.of(context).hintColor),
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                  child: _isOpenAbilityModal
                                      ? EditAbilityModal(
                                          abilityWidth: abilityWidth)
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          );
        });
  }
}
