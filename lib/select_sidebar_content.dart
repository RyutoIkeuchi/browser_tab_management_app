import 'package:browser_tab_management_app/pages/chart_page.dart';
import 'package:browser_tab_management_app/pages/dashboard_page.dart';
import 'package:browser_tab_management_app/pages/register_page.dart';
import 'package:browser_tab_management_app/pages/setting_page.dart';
import 'package:flutter/material.dart';

class SelectSidebarContent extends StatelessWidget {
  SelectSidebarContent({super.key, required this.selectedIndex});

  final int selectedIndex;

  final List<Widget> _pageList = [
    const DashboardPage(),
    const ChartPage(),
    RegisterPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return _pageList[selectedIndex];
  }
}
