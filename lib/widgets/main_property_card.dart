import 'package:flutter/material.dart';

class MainPropertyCard extends StatefulWidget {
  final Map<String, dynamic> data; //上位Widgetから受け取りたいデータ
  const MainPropertyCard({required this.data});

  MainPropertyCardState createState() => MainPropertyCardState();
}

class MainPropertyCardState extends State<MainPropertyCard> {
  bool isHoverAddButton = false;

  @override
  Widget build(BuildContext context) {
    return widget.data["name"] != null
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
                  print(widget.data);
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
                                    color: widget.data["color"],
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
                                    widget.data["icon"],
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
                                    widget.data["name"],
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
                        widget.data["description"],
                        style: TextStyle(
                            fontSize: 10, color: Theme.of(context).hintColor),
                      ),
                    )
                  ],
                )))
        : InkWell(
            onTap: () {
              print('aaa');
            },
            onHover: (isHover) {
              setState(() {
                isHoverAddButton = !isHoverAddButton;
              });
            },
            child: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 220,
                height: 120,
                decoration: BoxDecoration(
                    color:
                        isHoverAddButton ? Theme.of(context).focusColor : null,
                    border: Border.all(
                        width: 1, color: Theme.of(context).highlightColor)),
                child: IconButton(
                    onPressed: () {
                      print(widget.data);
                    },
                    icon: const Icon(Icons.add))));
  }
}
