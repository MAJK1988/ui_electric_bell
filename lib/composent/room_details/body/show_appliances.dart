import 'package:flutter/material.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/composent/room_details/body/single_appliance_show.dart';

class ShowAppliances extends StatefulWidget {
  final List<ApplianceElement> appliances;
  final Size size;
  const ShowAppliances({Key? key, required this.appliances, required this.size})
      : super(key: key);

  @override
  State<ShowAppliances> createState() => _StateShowAppliances();
}

class _StateShowAppliances extends State<ShowAppliances> {
  @override
  Widget build(BuildContext context) {
    double height = widget.size.height * 0.23;
    return Container(
      height: height,
      margin: const EdgeInsets.only(top: 25),
      child: ListView.builder(
          itemCount: widget.appliances.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return SingleApplianceShow(
                uid: '',
                index: i,
                size: widget.size,
                appliances: widget.appliances[i].appliance);
          }),
    );
  }
}
