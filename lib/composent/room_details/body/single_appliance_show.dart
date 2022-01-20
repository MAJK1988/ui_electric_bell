import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/constants.dart';

class SingleApplianceShow extends StatefulWidget {
  final Size size;
  final Appliance appliances;
  final String uid;
  final int index;
  const SingleApplianceShow(
      {Key? key,
      required this.size,
      required this.appliances,
      required this.uid,
      required this.index})
      : super(key: key);

  @override
  State<SingleApplianceShow> createState() => _StateSingleApplianceShow();
}

class _StateSingleApplianceShow extends State<SingleApplianceShow> {
  @override
  Widget build(BuildContext context) {
    final fireHome = FirebaseFirestore.instance
        .collection('User')
        .doc(widget.uid)
        .withConverter<Home>(
          fromFirestore: (snapshot, _) => Home.fromJson(snapshot.data()!),
          toFirestore: (home, _) => home.toJson(),
        );

    Future<void> setHomeInFirestore(
        // setHomeInFirestore
        // object: set Home In Firestore
        {required Home home}) async {
      await fireHome.set(home).then((value) {
        print('data add');
        upDate.value = !upDate.value;
      });
    }

    return ValueListenableBuilder<bool>(
        valueListenable: upDate,
        builder: (context, bool snapshot, Widget? child) {
          Appliance app = homeConstant
              .rooms[currentRooms].room.appliances[widget.index].appliance;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.size.width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(50, 132, 239, .16),
                        offset: Offset(0, 5),
                        blurRadius: 16)
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //alignment: Alignment.topLeft,
                        children: <Widget>[
                          Text(widget.appliances.name,
                              style: TextStyle(
                                fontSize: 12,
                                color: app.status ? Colors.blue : Colors.grey,
                              )),
                          Text(app.lastActivation,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: widget.size.width * 0.35,
                            child: Text(widget.appliances.roomName,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.topLeft,
                          width: widget.size.width * 0.35,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              app.iconPath,
                              height: widget.size.height * 0.089,
                              //width: size.width*0.08,
                              color: app.status ? Colors.blue : Colors.grey,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        )),
                    Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: app.status ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: widget.size.height * 0.23 * 0.2,
                      child: Switch(
                        value: widget.appliances.status,
                        onChanged: (value) async {
                          // _applianceDropInRoom is a function created to save appliance in a specific room in  homeConstant
                          // input : 1. appliance 2. indexRoom
                          homeConstant
                              .rooms[currentRooms]
                              .room
                              .appliances[widget.index]
                              .appliance
                              .status = !app.status;
                          await setHomeInFirestore(home: homeConstant);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
