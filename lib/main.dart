import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'providers/widget_global_key.dart';
import 'select_sidebar_content.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.get('YOUR_SUPABASE_URL'),
    anonKey: dotenv.get('YOUR_SUPABASE_ANON_KEY'),
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.brandBlue),
      // darkTheme: FlexThemeData.dark(scheme: FlexScheme.brandBlue),
      themeMode: ThemeMode.system,
      home: const BaseContainer(),
    );
  }
}

class BaseContainer extends ConsumerStatefulWidget {
  const BaseContainer({super.key});

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends ConsumerState<BaseContainer> {
  int selectedIndex = 0;
  bool _isExtended = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey appBarKey = ref.watch(appBarGlobalKeyProvider);
    final GlobalKey navigationRailKey =
        ref.watch(navigationRailGlobalKeyProvider);
    final supabase = Supabase.instance.client;
    print(supabase);

    return Scaffold(
      appBar: AppBar(
        key: appBarKey,
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
            key: navigationRailKey,
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
          const VerticalDivider(thickness: 1, width: 1),
          SelectSidebarContent(selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}
