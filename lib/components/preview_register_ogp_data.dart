import 'package:flutter/material.dart';

class PreviewRegisterOgpData extends StatelessWidget {
  const PreviewRegisterOgpData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 500,
      decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor,
          blurRadius: 2,
        )
      ]),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).shadowColor, width: 0.4))),
            child: Image.network(
                "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: Text(
                  "タイトル",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: Text(
                  'コンテンツコンテンツコンテンツコンテンツコンテンツコンテンツコンテンツ',
                  style: TextStyle(
                      fontSize: 14, color: Theme.of(context).disabledColor),
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
              Container(
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).focusColor),
                    child: Text(
                      'Hello',
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).focusColor),
                    child: Text(
                      'World',
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).focusColor),
                    child: Text(
                      '!!!!!!!!!!!',
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ],
      ),
    );
  }
}