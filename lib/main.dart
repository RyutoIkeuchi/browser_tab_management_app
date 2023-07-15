import 'package:browser_tab_management_app/select_sidebar_content.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.brandBlue),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.brandBlue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  bool _isExtended = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("ブラウザ管理アプリ"),
        elevation: 10,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle_rounded)),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.input_rounded)),
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: _isExtended,
            leading: InkWell(
              child: const Icon(Icons.menu),
              onTap: () {
                setState(() {
                  _isExtended = !_isExtended;
                });
              },
            ),
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.insert_chart),
                label: Text('chart'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add),
                label: Text('register'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('setting'),
              ),
            ],
            labelType: NavigationRailLabelType.none,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SelectSidebarContent(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
