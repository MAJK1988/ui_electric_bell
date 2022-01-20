import 'package:flutter/material.dart';
import 'package:ui_electric_bell/constants.dart';

class TimeScaletype extends StatefulWidget {
  final double positionRight, width;
  final String timeScale;

  final bool state;
  final Size size;
  const TimeScaletype(
      {Key? key,
      required this.positionRight,
      required this.width,
      required this.timeScale,
      required this.state,
      required this.size})
      : super(key: key);

  @override
  _TimeScaletypeState createState() => _TimeScaletypeState();
}

class _TimeScaletypeState extends State<TimeScaletype> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: widget.state ? widget.width : 0.9 * widget.width,
      height: widget.size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
        boxShadow: widget.state
            ? [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    // ignore: prefer_const_constructors
                    color: kPrimaryColor.withOpacity(0.2)),
                BoxShadow(
                    offset: const Offset(0, -2),
                    blurRadius: 5,
                    // ignore: prefer_const_constructors
                    color: kPrimaryColor.withOpacity(0.2)),
              ]
            : [const BoxShadow()],
        color: kBackgroundColor,
      ),
      child: Text(
        widget.timeScale,
        style: TextStyle(
            color: widget.state ? kPrimaryColor : Colors.black,
            fontSize: 12,
            fontWeight: widget.state ? FontWeight.bold : null),
      ),
    );
  }
}
