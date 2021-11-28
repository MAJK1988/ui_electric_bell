
import 'package:flutter/material.dart';
import 'package:ui_electric_bell/composent/my_home_page_state.dart';
import 'package:ui_electric_bell/constants.dart';
import 'package:ui_electric_bell/setting/fixation_threshold.dart';

import 'composent/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EPM Home Page',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>const HomePage(),//const MyHomePage(title: 'Flutter Demo Home Page'),
        '/settings': (context) => const FixationOfThreshold(),
      },
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}