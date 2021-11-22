import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_electric_bell/composent/time_scale_type.dart';
import 'package:ui_electric_bell/constants.dart';




 class Plot extends StatefulWidget {
   final Size size;
  
  const Plot({ Key? key ,required this.size}) : super(key: key);

  @override
  _PlotState createState() => _PlotState();
}

class _PlotState extends State<Plot> {

  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  late SelectionBehavior _selectionBehavior;
  late int indexData;
  late String graphTitle;

  @override
  void initState() {
    stateTileScaler[0] = true;
    indexData = 0;
    graphTitle = "Hour";
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    _selectionBehavior = SelectionBehavior(
        enable: true, selectedColor: Colors.red, unselectedColor: Colors.grey);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  late List<int> count =
      List<int>.generate(timeScalerSlectedString.length, (i) => i + 1);

  late bool stateHour = false,
      stateDay = false,
      stateWeek = false,
      stateMonth = false;
  void updateState(int i) {
    setState(() {
      for (var j = 0; j < stateTileScaler.length; j++) {
        stateTileScaler[j] = false;
      }
      stateTileScaler[i] = true;
      graphTitle = timeScalerSlectedString[i];
      indexData = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                right: kDefaultPadding,
                left: kDefaultPadding,
                bottom: kDefaultPadding),
            child:Container(
                alignment: Alignment.bottomLeft,
                height: widget.size.height * 0.5,
                width: widget.size.width * 0.9,
                decoration: getBoxDecoration(kBackgroundColor),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: SizedBox(
                        width: widget.size.width * 0.9-20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (var i in count)
                              GestureDetector(
                                onTap: () {
                                  updateState(i - 1);
                                },
                                child: TimeScaletype(
                                  state: stateTileScaler[i - 1],
                                  width: widget.size.width *
                                      (1 / (stateTileScaler.length + 3)),
                                  size: widget.size,
                                  positionRight: 0.0,
                                  timeScale: timeScalerSlectedString[i - 1],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        width: widget.size.width * 0.85,
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child:SfCartesianChart(
                            // Initialize category axis
                            primaryXAxis: CategoryAxis(
                                labelStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                title: AxisTitle(
                                    text: "Per $graphTitle",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                axisLine: const AxisLine(
                                  color: Colors.black,
                                  width: 2,
                                )),
                            legend: Legend(),
                            primaryYAxis: NumericAxis(
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                              labelFormat: '{value} Kw.H',
                              axisLine: const AxisLine(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            // Enable tooltip
                            tooltipBehavior: _tooltipBehavior,
                            zoomPanBehavior: _zoomPanBehavior,
                            series: <
                                LineSeries<ConsomeElectricPowerData, String>>[
                              LineSeries<ConsomeElectricPowerData, String>(
                                  dataSource: data[indexData],
                                  //selectionBehavior: _selectionBehavior,
                                  xValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.time,
                                  yValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.consumerFate,
                                  width: 2,
                                  color: kPrimaryColor,
                                  name: 'Elecrec consome',
                                  markerSettings:
                                      const MarkerSettings(isVisible: true))
                            ]),
                      ),
                    )
                  ],
                )));
  }
}