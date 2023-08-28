import 'package:flutter/material.dart';

class MainPropertyCard extends StatelessWidget {
  MainPropertyCard({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return data["name"] != null
        ? Container(
            margin: const EdgeInsets.only(left: 20),
            width: 220,
            height: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(10, 10),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: OutlinedButton(
                onPressed: () {
                  print(data);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  side: BorderSide.none,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const SizedBox(
                                width: 60,
                                height: 46,
                              ),
                              Positioned(
                                top: -10,
                                left: 10,
                                child: Container(
                                  width: 60,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color: data["color"],
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 5),
                                        blurRadius: 2.0,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    data["icon"],
                                    size: 30,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    data["name"],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(context).dividerColor, //枠線の色
                            width: 0.5, //枠線の太さ
                          ),
                        ),
                      ),
                      child: Text(
                        data["description"],
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).hintColor),
                      ),
                    )
                  ],
                )))
        : Container(
            margin: const EdgeInsets.only(left: 20),
            width: 220,
            height: 120,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).primaryColor)),
            child: IconButton(
                onPressed: () {
                  print(data);
                },
                icon: Icon(Icons.add)));
  }
}
