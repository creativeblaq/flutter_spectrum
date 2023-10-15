import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spectrum/enums/enums.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Animate.restartOnHotReload = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(
        initialIndex: 0,
      ),
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

class HomeScreen extends HookWidget {
  const HomeScreen({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    final currentIndex = useState(initialIndex);
    final pageController = usePageController(initialPage: initialIndex);
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          currentIndex.value = value;
        },
        children: const [
          Enums(),
          Enums(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        selectedItemColor: themeColors.primary,
        unselectedItemColor: Colors.blueGrey[600],
        onTap: (value) {
          pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
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
