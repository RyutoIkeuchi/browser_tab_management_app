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
          const SizedBox(height: 40),
          Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(10, 10),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                      ),
                      Positioned(
                        top: -15,
                        left: 20,
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 5),
                                blurRadius: 2.0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Icon(Icons.airplane_ticket),
                        ),
                      ),
                    ],
                  ),
                  Text('ああああ'),
                ]),
          ),
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
