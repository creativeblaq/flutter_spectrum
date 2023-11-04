import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spectrum/utils/router.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  usePathUrlStrategy();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routingProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff005c9a),
          brightness: Brightness.dark,
          surface: const Color(0xFF17202C),
          background: const Color(0xFF0E1215),
        ),
        useMaterial3: true,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.navigationShell,
  });
  static const String routeName = 'home';
  static const String routeLocation = '/$routeName';

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    //final currentIndex = useState(widget.initialIndex);
    //final pageController = usePageController(initialPage: widget.initialIndex);
    return Scaffold(
      key: scaffoldKey,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        selectedItemColor: themeColors.primary,
        unselectedItemColor: Colors.blueGrey[600],
        onTap: _goBranch,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stacked_bar_chart_outlined,
            ),
            label: 'Enums',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.extension,
            ),
            label: 'Extensions',
          ),
        ],
      ),
    );
  }
}
