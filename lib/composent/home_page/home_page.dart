// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/auth/services/auth.dart';

import 'body/firbase_firestore.dart';

import 'body/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<UserLocal> getNameUidEmail() async {
    final SharedPreferences prefs = await _prefs;
    final String nAme = (prefs.getString('name') ?? '');
    final String uId = (prefs.getString('uid') ?? '');
    final String eMail = (prefs.getString('email') ?? '');
    return UserLocal(email: eMail, uid: uId, name: nAme);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavBar(),
      body: FutureBuilder<UserLocal>(
          future: getNameUidEmail(),
          builder: (BuildContext context, AsyncSnapshot<UserLocal> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  var testUser = snapshot.data;
                  if (testUser != null && testUser.uid != '') {
                    return FirebaseFireStore(size: size, user: testUser);
                  } else {
                    FireAuth.logOut(context: context);
                    return const CircularProgressIndicator();
                  }
                }
            }
          }),
      //HomeBody(size:size),
    );
  }
}
