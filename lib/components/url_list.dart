import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UrlList extends StatefulWidget {
  const UrlList({super.key});

  _UrlListState createState() => _UrlListState();
}

class _UrlListState extends State<UrlList> {
  List photosList = [];

  Future fetchJsonPlaceHolderApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos?_start=0&_limit=100'));
    setState(() {
      photosList = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchJsonPlaceHolderApi();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: photosList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 5,
          childAspectRatio: 10 / 8.47),
      itemBuilder: (context, index) {
        return Container(
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
                    child: photosList[index]["url"] != ""
                        ? Image.network(photosList[index]["url"],
                            fit: BoxFit.cover)
                        : ColoredBox(
                            color: Theme.of(context).highlightColor,
                            child: const Center(child: Text('サムネイル')),
                          ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Text(
                          photosList[index]["title"],
                          style: const TextStyle(fontSize: 16),
                        ),
                      )),
                ],
              ),
            ));
      },
    );
  }
}
