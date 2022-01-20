import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInforShow extends StatelessWidget {
  final String name;
  final Size size;
  const UserInforShow({Key? key, required this.name, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(top: size.height * 0.05, left: size.width * 0.05),
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
                      style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 16),
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
