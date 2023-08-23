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
  final DUMMY_TAB_NAME_LIST = [
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
        TabController(vsync: this, length: DUMMY_TAB_NAME_LIST.length);
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
        color: Theme.of(context).primaryColorLight,
        child: Column(children: [
          const SizedBox(height: 60),
          Container(
            height: 44,
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: DUMMY_TAB_NAME_LIST.map<Widget>((d) {
                return Tab(
                  child: Center(
                    child: Container(
                      child: Text(
                        d,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue.shade200,
              child: TabBarView(
                key: key,
                controller: _tabController,
                children: DUMMY_TAB_NAME_LIST.map<Widget>((d) {
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
