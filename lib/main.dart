import 'package:cleennews/view/CategoriesPages/Categories.dart';
import 'package:cleennews/view/HomePage/Home.dart';
import 'package:flutter/material.dart';

import ' basicswidget/nave.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigationKey,
      routes: {
        "Categories": (BuildContext context) => Categories(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

