import 'package:flutter/material.dart';

import '../components/url_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).primaryColorLight,
        child: Center(
          child: UrlList(),
        ),
      ),
    );
  }
}
