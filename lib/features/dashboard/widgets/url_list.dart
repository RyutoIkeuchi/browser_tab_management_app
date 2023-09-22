import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UrlList extends StatefulWidget {
  const UrlList({super.key});

  _UrlListState createState() => _UrlListState();
}

class _UrlListState extends State<UrlList> {
  List photosList = [];
  int? hoveredItemIndex = null;
  List urlList = [];

  Future fetchJsonPlaceHolderApi() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?_start=0&_limit=100'));
    setState(() {
      photosList = jsonDecode(response.body);
    });
  }

  Future<void> getOgpDataListFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = prefs.getString("OGP_DATA");
    urlList = jsonDecode(response!);
  }

  @override
  void initState() {
    super.initState();
    fetchJsonPlaceHolderApi();
    getOgpDataListFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: urlList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 5,
          childAspectRatio: 10 / 8.47),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              print('いいいい');
            },
            onHover: (val) {
              setState(() {
                if (val) {
                  hoveredItemIndex = index;
                } else {
                  hoveredItemIndex = null;
                }
              });
            },
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 240 * 0.66,
                          child: urlList[index]["image"] != ""
                              ? Image.network(urlList[index]["image"],
                                  fit: BoxFit.cover)
                              : ColoredBox(
                                  color: Theme.of(context).highlightColor,
                                  child: const Center(child: Text('サムネイル')),
                                ),
                        ),
                        Container(
                            height: 240 * 0.34,
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Text(
                                urlList[index]["title"],
                                style: const TextStyle(fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  )),
              hoveredItemIndex == index
                  ? Positioned(
                      top: 4,
                      right: 4,
                      child: IconButton(
                          color: Theme.of(context).canvasColor,
                          onPressed: () async {
                            if (await canLaunch(urlList[index]["url"])) {
                              await launch(
                                urlList[index]["url"],
                                forceSafariVC: true,
                                forceWebView: true,
                              );
                            }
                          },
                          icon: const Icon(Icons.open_in_new)))
                  : Container(child: null)
            ]));
      },
    );
  }
}
