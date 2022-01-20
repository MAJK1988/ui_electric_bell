import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/composent/room_details/body/body_room_details.dart';

class RoomDetails extends StatefulWidget {
  final Room room;
  const RoomDetails({Key? key, required this.room}) : super(key: key);

  @override
  State<RoomDetails> createState() => _StateRoomDetails();
}

class _StateRoomDetails extends State<RoomDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodayRoomDetails(room: widget.room),
    );
  }
}
