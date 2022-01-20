import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/composent/meter/thermometer.dart';
import 'package:ui_electric_bell/composent/room_details/body/image_and_icons.dart';
import 'package:ui_electric_bell/constants.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

import 'show_appliances.dart';

class BodayRoomDetails extends StatefulWidget {
  final Room room;
  const BodayRoomDetails({Key? key, required this.room}) : super(key: key);

  @override
  State<BodayRoomDetails> createState() => _StateBodayRoomDetails();
}

class _StateBodayRoomDetails extends State<BodayRoomDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //ImageAndIcons(room:widget.room,size: size),
          //const SizedBox(height: kDefaultPadding/2),
          //const Thermometer(temperature: 30,endValue: 45),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(right: 0.0, left: 10),
            child: const Text(
              "All Appliances",
              style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ShowAppliances(size: size, appliances: widget.room.appliances)
        ],
      ),
    );
  }
}
