// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_electric_bell/constants.dart';

class TitleSection extends StatefulWidget {
  final String valeur;
  final Size size;
  final String title;
  // ignore: prefer_const_constructors_in_immutables
  TitleSection({
    required this.size,
    required this.valeur,
    required this.title,
    Key? key,
  }) : super(key: key);
  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecoration(kBackgroundColor),
      height: widget.size.height * 0.06,
      width: widget.size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Positioned(
              right: 10,
              child: Text(
                widget.valeur,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
