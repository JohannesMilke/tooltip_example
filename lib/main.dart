import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tooltip_example/page/practical_tooltip_page.dart';
import 'package:tooltip_example/page/theoretical_tooltip_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Tooltip Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('Tooltip'),
              title: Text('Practical'),
            ),
            BottomNavigationBarItem(
              icon: Text('Tooltip'),
              title: Text('Theoretically'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return PracticalTooltipPage();
      case 1:
        return TheoreticalTooltipPage();
      default:
        return Container();
    }
  }
}
