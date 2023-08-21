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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
              controller: _tabController,
              indicatorColor: Colors.transparent, //タブ下部のline(インジケータ)の色を消す
              tabs: [
                _Tab(
                  label: 'Flutter',
                  index: 0,
                  tabControllerIndex: _currentIndex,
                ),
                _Tab(
                  label: 'Dart',
                  index: 1,
                  tabControllerIndex: _currentIndex,
                ),
                _Tab(
                  label: 'Firebase',
                  index: 2,
                  tabControllerIndex: _currentIndex,
                ),
              ],
            ),
          ),
           Expanded(
              child: Container(
                color: Colors.blue.shade200,
                child: TabBarView(
                  key: key,
                  controller: _tabController,
                  children: <Widget>[
                    UrlList(),
                    _TabBarView(
                      label: 'Dart',
                      index: _currentIndex,
                    ),
                    _TabBarView(
                      label: 'Firebase',
                      index: _currentIndex,
                    ),
                  ],
                ),
              ),),
        ]),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    Key? key,
    required this.label,
    required this.index,
    required this.tabControllerIndex,
  }) : super(key: key);

  final String label;
  final int index;
  final int tabControllerIndex;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          decoration: BoxDecoration(
            color:
                index == tabControllerIndex ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: index == tabControllerIndex ? Colors.white : Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  final String label;
  final index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'index:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${index.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
