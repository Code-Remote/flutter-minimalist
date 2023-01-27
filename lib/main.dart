import 'package:flutter/cupertino.dart';
import 'package:flutter_minimalist/cupertino/CupertinoHome.dart';

import 'ServiceLocator.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return buildCupertinoApp();
  }

  CupertinoApp buildCupertinoApp() {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoHomePage(),
    );
  }
}
