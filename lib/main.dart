
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/Screens/Welcome/welcome_screen.dart';
import 'package:ui_electric_bell/constants.dart';
import 'package:ui_electric_bell/welcome/home_welcome.dart';

import 'composent/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EPM Home Page',
      /*routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>const HomeWelcome(title: 'Welcome Screen Demo'),
        '/home': (context) =>const HomePage(),//const MyHomePage(title: 'Flutter Demo Home Page'),
        '/settings': (context) => const FixationOfThreshold(),
        '/show_details': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
      },*/
      theme: ThemeData(
        backgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
           // print("you have error");
            return const Text("Somethong went wrong");
          } else if (snapshot.hasData) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final user = snapshot.data;
                  if (user!= null) {
                    return const HomePage();
                  } else {
                    return const HomeWelcome(title: 'Welcome Screen Demo');
                  }
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}