import 'package:browser_tab_management_app/widgets/main_property_card.dart';
import 'package:flutter/material.dart';

import '../widgets/url_list.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  final key = GlobalKey();
  final List<Map<String, dynamic>> DUMMY_MAIN_PROPERTY_LIST = [
    {
      "name": "プログラミング",
      "icon": Icons.language,
      "color": Colors.pink[400],
      "description": "あああああああああああああ"
    },
    {
      "name": "インフラ(生活)",
      "icon": Icons.wb_incandescent,
      "color": Colors.green[400],
      "description": "あああああああああああああ"
    },
    {
      "name": "副業",
      "icon": Icons.monetization_on,
      "color": Colors.amber[400],
      "description": "あああああああああああああ"
    },
    {
      "name": "転職",
      "icon": Icons.assignment_ind,
      "color": Colors.indigo[400],
      "description": "あああああああああああああ"
    },
    {
      "name": "物件",
      "icon": Icons.home,
      "color": Colors.purple[400],
      "description": "あああああああああああああ"
    }
  ];

  final DUMMY_SUB_PROPERTY_LIST = [
    'Flutter',
    'React',
    'TypeScript',
    'Python',
    'Next.js',
    'HTML',
    'Go',
    'Rust',
    'Power BI',
    'Flutter',
    'React',
    'TypeScript',
    'Python',
    'Next.js',
    'HTML',
    'Go',
    'Rust',
    'Power BI',
    'Flutter',
    'React',
    'TypeScript',
    'Python',
    'Next.js',
    'HTML',
    'Go',
    'Rust',
    'Power BI',
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: DUMMY_SUB_PROPERTY_LIST.length);
    _tabController!.addListener(() {
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).cardColor,
        child: Column(children: [
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...DUMMY_MAIN_PROPERTY_LIST,
                {
                  "name": null,
                  "icon": null,
                  "color": null,
                  "description": null
                },
              ].map<Widget>((e) => MainPropertyCard(data: e)).toList(),
            ),
          ),
          SizedBox(
            height: 44,
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Theme.of(context).disabledColor,
              controller: _tabController,
              tabs: DUMMY_SUB_PROPERTY_LIST.map<Widget>((d) {
                return Tab(
                  child: Center(
                    child: Text(
                      d,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).highlightColor,
              child: TabBarView(
                key: key,
                controller: _tabController,
                children: DUMMY_SUB_PROPERTY_LIST.map<Widget>((d) {
                  return UrlList();
                }).toList(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
