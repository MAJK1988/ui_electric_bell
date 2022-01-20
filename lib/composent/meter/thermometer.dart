import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Thermometer extends StatefulWidget {
  final double temperature, endValue;
  const Thermometer(
      {Key? key, required this.temperature, required this.endValue})
      : super(key: key);

  @override
  State<Thermometer> createState() => _StateThermometer();
}

class _StateThermometer extends State<Thermometer> {
  @override
  Widget build(BuildContext context) {
    return getThermometer(widget.temperature, widget.endValue);
  }
}

Widget getThermometer(double temperature, double endValue) {
  return SfLinearGauge(
    numberFormat: NumberFormat('C '),
    labelPosition: LinearLabelPosition.outside,
    orientation: LinearGaugeOrientation.vertical,
    maximum: endValue,
    showTicks: false,
    animateRange: true,
    animationDuration: 3000,

    minorTicksPerInterval: 5,
    useRangeColorForAxis: true,
    animateAxis: true,
    //axisTrackStyle:const  LinearAxisTrackStyle(thickness: 1),
    axisTrackExtent: 30,
    markerPointers: [
      LinearWidgetPointer(
        offset: 10,
        position: LinearElementPosition.inside,
        value: temperature,
        child: Text(
          getString(temperature),
          style: TextStyle(color: getColor(temperature)),
        ),
      ),
    ],

    barPointers: [
      LinearBarPointer(
        color: getColor(temperature),
        value: temperature,
        thickness: 15,
      )
    ],
    axisTrackStyle: LinearAxisTrackStyle(
        thickness: 20,
        color: Colors.white,
        borderColor: getColor(temperature),
        borderWidth: 1,
        edgeStyle: LinearEdgeStyle.bothCurve),
  );
}

Color getColor(double value) {
  if (value < 12) {
    return Colors.blue;
  }
  if (value > 12 && value < 38) {
    return const Color(0xffFFC93E);
  } else {
    return const Color(0xffF45656);
  }
}

String getString(double value) {
  if (value < 12) {
    return 'Cold';
  }
  if (value > 12 && value < 38) {
    return 'Medl';
  } else {
    return 'Hot';
  }
}
