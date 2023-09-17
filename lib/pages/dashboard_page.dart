import 'package:flutter/material.dart';

import '../constants/dummys/main_property_list.dart';
import '../constants/dummys/sub_property_list.dart';
import '../features/dashboard/widgets/url_list.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  int? selectedMainPropertyId = null;
  List subPropertyList = DUMMY_SUB_PROPERTY_LIST;
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: subPropertyList.length);
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

  void handleChangeMainPropertyId(selectedId) {
    setState(() {
      selectedMainPropertyId = selectedId;
      subPropertyList = DUMMY_SUB_PROPERTY_LIST
          .where((element) => element["main_property_id"] == selectedId)
          .toList();
    });
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
              ]
                  .map<Widget>((e) => MainPropertyCard(
                      data: e,
                      handleChangeMainPropertyId: handleChangeMainPropertyId))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 44,
            width: double.infinity,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Theme.of(context).disabledColor,
              controller: _tabController,
              tabs: subPropertyList.map<Widget>((d) {
                return Tab(
                  child: Center(
                    child: Text(
                      d["name"],
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
