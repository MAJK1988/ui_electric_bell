import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ui_electric_bell/constants.dart';

class Comperson extends StatefulWidget {
  final Size size;
  final String title;
  final ChartSampleData data;
  const Comperson(
      {Key? key, required this.size, required this.title, required this.data})
      : super(key: key);

  @override
  State<Comperson> createState() => _CompersonState();
}

class _CompersonState extends State<Comperson> {
  @override
  Widget build(BuildContext context) {
    Result result = getMAx(widget.data.average, widget.data.required_);
    double max = result.max;
    bool averageIsMax = result.averageIsMax;
    double interval = getinterval(max);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.center,
          decoration: getBoxDecoration(kBackgroundColor),
          height: widget.size.height * 0.2,
          width: widget.size.width * 0.95,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Stack(
                  alignment: const Alignment(-0.8, -1.5),
                  children: [
                    Text((widget.data.period!) + ' average : ',
                        style: TextStyle(
                            color: averageIsMax ? Colors.red : kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SfSlider(
                      activeColor: averageIsMax ? Colors.red : kPrimaryColor,
                      min: 0.0,
                      max: max,
                      value: widget.data.average,
                      interval: interval,
                      showTicks: true,
                      showLabels: false,
                      enableTooltip: true,
                      tooltipShape: const SfPaddleTooltipShape(),
                      onChanged: (dynamic newValue) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                alignment: const Alignment(-0.8, -1.3),
                children: [
                  Text((widget.data.period!) + ' required : ',
                      style: TextStyle(
                          color: averageIsMax ? kPrimaryColor : Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  SfSlider(
                    //stepDuration:SliderStepDuration(seconds:10),
                    activeColor: averageIsMax ? kPrimaryColor : Colors.red,
                    min: 0.0,
                    max: max,
                    value: widget.data.required_,
                    interval: interval,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    //numberFormat: NumberFormat("KW.H"),
                    tooltipShape: const SfPaddleTooltipShape(),
                    onChanged: (dynamic newValue) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

double getinterval(double? value) {
  int deviser = 5;
  double firstInterval = ((value! / deviser).round()).toDouble();
  if (firstInterval * deviser > value) {
    return firstInterval;
  } else {
    return ((value / deviser + 1).round()).toDouble();
  }
}

Result getMAx(double? average, double? required_) {
  if (average! > required_!) {
    return Result(((average * 1.3).round()).toDouble(), true);
  } else {
    return Result(((required_ * 1.3).round()).toDouble(), false);
  }
}

class Result {
  final double max;
  final bool averageIsMax;
  Result(this.max, this.averageIsMax);
}
