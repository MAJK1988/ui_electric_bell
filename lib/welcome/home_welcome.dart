import 'dart:developer';
import 'package:ui_electric_bell/auth/Screens/Welcome/welcome_screen.dart';
import 'package:ui_electric_bell/composent/home_page/home_page.dart';
import 'package:ui_electric_bell/constants.dart';

import 'pointer.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class HomeWelcome extends StatefulWidget {
  const HomeWelcome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeWelcome> createState() => _HomeWelcomeState();
}

class _HomeWelcomeState extends State<HomeWelcome> {
  int pageIndex = 0;
  double? currentPage = 0.0;
  late final PageController _pageViewController =
      PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page;
      });
    });
  }

  Widget slideView(int indexItem) {
    var blue = Colors.blue.shade100;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: blue,
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: Offset.zero),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      items[indexItem]['image'],
                      width: 0.8 * MediaQuery.of(context).size.width,
                      height: 0.8 * MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                    ),
                  ),
                )),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(items[indexItem]['header'],
                        style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w300,
                            color: Color(0XFF3F3D56),
                            height: 2.0)),
                    Text(
                      items[indexItem]['description'],
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 1.2,
                          fontSize: 16.0,
                          height: 1.3),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor:kPrimaryColor
        ),
        body: Stack(
          children: <Widget>[
            PageView.builder(
                controller: _pageViewController,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  _pageViewController.addListener(() {
                    currentPage = _pageViewController.page!;
                    pageIndex = currentPage!.round();
                    log('pageindex: $pageIndex');
                    log('index: ${currentPage!.round()}');
                  });
                  return slideView(index);
                }),
            Pointer(index: pageIndex, length: items.length),
            if (pageIndex == items.length - 1)
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.85,
                  bottom: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.east),
                        tooltip: 'Increase volume by 10',
                        onPressed: () {
                          setState(() {Navigator.pushAndRemoveUntil( 
                            context,MaterialPageRoute(
                              builder: (context) =>const WelcomeScreen()),
                              (Route<dynamic> route) => false,
                              );});
                        },
                      ),
                      //Text('Volume ')
                    ],
                  ))
          ],
        ));
  }
}