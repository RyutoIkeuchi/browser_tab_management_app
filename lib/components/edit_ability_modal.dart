import 'package:flutter/material.dart';

class EditAbilityModal extends StatelessWidget {
  final List<String> DUMMY_ABILITY_LIST = ["Hello", "World", "!!!!!!!!!"];

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        width: 500,
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
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: DUMMY_ABILITY_LIST
                          .map((e) => Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context).focusColor),
                              child: Row(
                                children: [
                                  Text(
                                    e,
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
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
                          .toList()),
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
              ],
            )));
  }
}
