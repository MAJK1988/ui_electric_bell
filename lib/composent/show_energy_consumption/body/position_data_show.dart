import 'package:flutter/material.dart';

import '../../../constants.dart';

class PositionDataShow extends StatefulWidget {
  //positionUsed(Size size,double left, double top,
  // String title, String valeur,String price,Color valeurPriceColor )
  final Size size;
  final double left, top;
  final String title, price, valeur;
  final Color valeurPriceColor;
  const PositionDataShow(
      {Key? key,
      required this.size,
      required this.left,
      required this.top,
      required this.title,
      required this.price,
      required this.valeur,
      required this.valeurPriceColor})
      : super(key: key);

  @override
  State<PositionDataShow> createState() => _PositionDataShowState();
}

class _PositionDataShowState extends State<PositionDataShow> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Container(
          alignment: Alignment.center,
          width: widget.size.width * .41,
          height: widget.size.height * .18,
          decoration: getBoxDecoration(Colors.white),
          child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  SizedBox(height: widget.size.height * .018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.valeur,
                          style: TextStyle(
                              color: widget.valeurPriceColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Text(widget.price,
                          style: TextStyle(
                              color: widget.valeurPriceColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ))),
    );
  }
}
