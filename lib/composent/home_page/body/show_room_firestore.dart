// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
//import 'package:ui_electric_bell/composent/home_page/body/show_room_info_firebase.dart';

import '../../../constants.dart';
import 'room_infor_show.dart';
import 'show_room_info_firebase.dart';

class ShowRoomFirebase extends StatefulWidget {
  final UserLocal user;
  final Size size;
  final Home home;
  const ShowRoomFirebase(
      {Key? key, required this.user, required this.size, required this.home})
      : super(key: key);

  @override
  State<ShowRoomFirebase> createState() => _StateShowRoomFirebase();
}

class _StateShowRoomFirebase extends State<ShowRoomFirebase> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: upDate,
        builder: (context, bool snapshot, Widget? child) {
          return SizedBox(
            height: widget.size.height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.home.rooms.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentRooms = index;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowRoomInfoFirebase(
                              room: widget.home.rooms[index].room,
                              uid: widget.user.uid,
                              size: widget.size)),
                    );
                  },
                  child: RoomInforShow(
                      size: widget.size,
                      room: widget.home.rooms[index].room,
                      clicked: currentRooms == index),
                );
              },
            ),
          );
        });
  }
}
