import 'package:flutter/material.dart';
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
  bool _isOpenAbilityModal = false;

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
                              clipBehavior: Clip.none,
                              children: [
                                Row(children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 6),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
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
                                        borderRadius: BorderRadius.circular(30),
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
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context).focusColor),
                                    child: Text(
                                      '!!!!!!!!!!!',
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor),
                                    ),
                                  ),
                                ]),
                                Container(
                                  child: _isOpenAbilityModal
                                      ? Positioned(
                                          top: 0,
                                          left: 0,
                                          width: 250,
                                          height: 250,
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            color: Colors.red[400],
                                            child: const Text(
                                              '赤（真ん中）',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        )
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
