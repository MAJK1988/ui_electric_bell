import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';
import 'package:ui_electric_bell/composent/meter/thermometer.dart';
import '../../../constants.dart';

class ImageAndIcons extends StatefulWidget {
  final Size size;
  final Room room;
  const ImageAndIcons({Key? key, required this.size, required this.room})
      : super(key: key);

  @override
  State<ImageAndIcons> createState() => _StateImageAndIcons();
}

class _StateImageAndIcons extends State<ImageAndIcons> {
  @override
  Widget build(BuildContext context) {
    double height = widget.size.height * 0.5;
    return SizedBox(
      height: height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SafeArea(
                      child: SizedBox(
                          height: height * 0.5,
                          child: Thermometer(
                              temperature: double.parse(
                                  widget.room.genralData.temperature),
                              endValue: double.parse(
                                      widget.room.genralData.temperature) +
                                  15.0))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: height * 0.9,
              width: widget.size.width * 0.5,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: height * 0.1,
                    right: 15,
                    child: SizedBox(
                      width: widget.size.width * 0.45,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "${widget.room.name}\n",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: SizedBox(
                      height: height * 0.6,
                      width: widget.size.width * 0.5,
                      child: SvgPicture.asset(
                        widget.room.iconPath,
                        height: height * 0.7,
                        width: widget.size.width * 0.4,
                        color: kPrimaryColor,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
