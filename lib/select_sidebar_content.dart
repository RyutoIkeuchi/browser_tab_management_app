import 'package:flutter/material.dart';

import 'pages/chart_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/register_page.dart';
import 'pages/setting_page.dart';

class SelectSidebarContent extends StatelessWidget {
  SelectSidebarContent({super.key, required this.selectedIndex});

  final int selectedIndex;

  final List<Widget> _pageList = [
    DashboardPage(),
    const ChartPage(),
    RegisterPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return _pageList[selectedIndex];
  }
}
