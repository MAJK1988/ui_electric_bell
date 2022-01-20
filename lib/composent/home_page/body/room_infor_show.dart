import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_electric_bell/auth/object/home_object.dart';

import '../../../constants.dart';

class RoomInforShow extends StatefulWidget {
  final Size size;
  final Room room;
  final bool clicked;
  const RoomInforShow(
      {Key? key, required this.size, required this.room, required this.clicked})
      : super(key: key);

  @override
  State<RoomInforShow> createState() => _StateRoomInforShow();
}

class _StateRoomInforShow extends State<RoomInforShow> {
  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.size.height * 0.15,
        //width: size.width*0.35,
        margin: EdgeInsets.only(
            right: widget.size.width * 0.015, left: widget.size.width * 0.015),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(50, 132, 239, .16),
                offset: Offset(0, 5),
                blurRadius: 16)
          ],
          //room status
          color: widget.clicked ? kBackgroundColor : Colors.white,
        ),
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //Icons path
                      child: SvgPicture.asset(
                        widget.room.iconPath,
                        height: widget.size.height * 0.12,
                        width: widget.size.width * 0.32,
                        color: Colors.blue,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    //room name
                    child: Text(
                      widget.room.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
          ],
        ));
  }
}
