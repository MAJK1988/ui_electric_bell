import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/auth/services/auth.dart';
import 'package:ui_electric_bell/composent/home_page/body/bill_infor_show.dart';

import 'package:ui_electric_bell/composent/home_page/body/user_information.dart';
import 'package:ui_electric_bell/constants.dart';

import 'show_room_firestore.dart';

class ShowObject extends StatefulWidget {
  final Size size;
  final UserLocal user;
  const ShowObject({Key? key, required this.size, required this.user})
      : super(key: key);

  @override
  State<ShowObject> createState() => _StateShowObject();
}

class _StateShowObject extends State<ShowObject> {
  Future<Home> getHome({required DocumentReference<Home> fireHome}) async {
    //getHome
    // object: get the saved home in firebase and set in homeConstant
    // input: 1. DocumentReference<Home>
    // output: the saved home in firebase or new home object
    return await fireHome
        .get()
        .then((snapshot) => homeConstant = snapshot.data()!)
        .catchError((error, stackTrace) => homeConstant);
  }

  @override
  Widget build(BuildContext context) {
    final fireHome = FirebaseFirestore.instance
        .collection('User')
        .doc(widget.user.uid)
        .withConverter<Home>(
          fromFirestore: (snapshot, _) => Home.fromJson(snapshot.data()!),
          toFirestore: (home, _) => home.toJson(),
        );

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder<Home>(
            future: getHome(fireHome: fireHome),
            builder: (context, AsyncSnapshot<Home> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.data != null) {
                      // if snapshot has data go to ShowAllObject class
                      return Column(children: <Widget>[
                        UserInforShow(
                            name: widget.user.name, size: widget.size),
                        const Divider(),
                        setTitle(title: "Bill info"),
                        BillInforShow(
                            size: widget.size, bill: snapshot.data!.bill),
                        setTitle(title: "Rooms List"),
                        ShowRoomFirebase(
                          user: widget.user,
                          size: widget.size,
                          home: snapshot.data!,
                        ),
                      ]);
                    } else {
                      FireAuth.logOut(context: context);
                      return const CircularProgressIndicator();
                    }
                  }
              }
            }));
  }
}

Widget setTitle({required String title}) {
  return Padding(
    padding: const EdgeInsets.only(
        top: kDefaultPadding / 2,
        right: kDefaultPadding,
        left: kDefaultPadding,
        bottom: kDefaultPadding),
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 8.0, color: Colors.lightBlue.shade600),
          bottom: BorderSide(width: 8.0, color: Colors.lightBlue.shade600),
        ),
        color: Colors.white,
      ),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(right: 30.0, left: 30),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
