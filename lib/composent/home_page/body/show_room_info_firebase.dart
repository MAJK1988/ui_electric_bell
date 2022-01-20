import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/composent/room_details/body/image_and_icons.dart';
import 'package:ui_electric_bell/composent/room_details/body/single_appliance_show.dart';

class ShowRoomInfoFirebase extends StatefulWidget {
  final Room room;
  final String uid;
  final Size size;
  const ShowRoomInfoFirebase(
      {Key? key, required this.room, required this.uid, required this.size})
      : super(key: key);

  @override
  State<ShowRoomInfoFirebase> createState() => _StateShowRoomInfoFirebase();
}

class _StateShowRoomInfoFirebase extends State<ShowRoomInfoFirebase> {
  late int currentRooms;
  @override
  Widget build(BuildContext context) {
    //appliances
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ImageAndIcons(room: widget.room, size: widget.size),
          SizedBox(
            height: widget.size.height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.room.appliances.length,
              itemBuilder: (BuildContext context, index) {
                Appliance app = widget.room.appliances[index].appliance;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentRooms = index;
                    });
                  },
                  child: SingleApplianceShow(
                      uid: widget.uid,
                      size: widget.size,
                      appliances: app,
                      index: index),
                );
              },
            ),
          )
        ],
      )),
    );
    /**/
  }
}
