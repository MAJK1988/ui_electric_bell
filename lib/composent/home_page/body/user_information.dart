import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_electric_bell/constants.dart';

class UserInforShow extends StatelessWidget {
  final String name;
  final Size size;
  const UserInforShow({Key? key, required this.name, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: getBoxDecoration(kBackgroundColor),
        margin: EdgeInsets.only(
            top: size.height * 0.05,
            left: size.width * 0.055,
            right: size.width * 0.055,
            bottom: size.height * 0.01),
        padding: EdgeInsets.all(size.height * 0.016),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /************************* */
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Hello',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: size.height * 0.03),
                    )
                  ]),
              /************************* */
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat("hh:mm").format(DateTime.now()),
                        style: const TextStyle(
                            color: Color.fromRGBO(26, 141, 255, 1),
                            fontSize: 24),
                      ),
                      Text(DateFormat("a").format(DateTime.now()),
                          style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 9)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  )),
            ]));
  }
}
