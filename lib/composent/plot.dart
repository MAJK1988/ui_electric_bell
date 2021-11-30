import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_electric_bell/composent/time_scale_type.dart';
import 'package:ui_electric_bell/constants.dart';




 class Plot extends StatefulWidget {
   final Size size;
   final bool plotTwoLine;
   final double requiredPower;
  
  const Plot({ Key? key ,required this.size, required this.plotTwoLine, required this.requiredPower}) : super(key: key);

 

  @override
  _PlotState createState() => _PlotState();
}

class _PlotState extends State<Plot> {

  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  late SelectionBehavior _selectionBehavior;
  
  late String graphTitle;

  @override
  void initState() {
    for (var j = 0; j < stateTileScaler.length; j++) {
        stateTileScaler[j] = false;
      }
    stateTileScaler[0] = true;
    graphTitle = "Hour";
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.xy,

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
    });
  }

  @override
  Widget build(BuildContext context) {
    double width=widget.size.width * 0.9;
    return  Padding(
            padding: getEdgeInsets(),
            child:Container(
                alignment: Alignment.bottomLeft,
                height: widget.size.height * 0.5,
                width:width ,
                decoration: getBoxDecoration(kBackgroundColor),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 10,
                      child: SizedBox(
                        width: 0.9*width,
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
                                  width:(width-20)*
                                      (1 / (stateTileScaler.length +1)),
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
                      top: widget.size.height*0.015,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        width: widget.size.width * 0.85,
                        height: widget.size.height *0.47,
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child:SfCartesianChart(
                            // Initialize category axis
                            legend: Legend(
                              isVisible:widget.plotTwoLine,
                              position:LegendPosition.top,
                            ),
                            primaryXAxis: CategoryAxis(
                                labelStyle:  TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                title: AxisTitle(
                                    text: "Per $graphTitle",
                                    textStyle:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                axisLine: const AxisLine(
                                  color: Colors.black,
                                  width: 2,
                                )),

                            
                            
                            primaryYAxis: NumericAxis(
                              
                              plotOffset: 0,
                              labelStyle:  TextStyle(
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
                                  dataSource: data[stateTileScaler.indexOf(true)],
                                  //selectionBehavior: _selectionBehavior,
                                  xValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.time,
                                  yValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.consumerFate,
                                  width: 2,
                                  color: kPrimaryColor,
                                  name: 'Average',
                                  markerSettings:
                                      const MarkerSettings(isVisible: true)),
                                      /******************************************** */

                                      if (widget.plotTwoLine)
                                      LineSeries<ConsomeElectricPowerData, String>(
                                        
                                  dataSource:getRequiredline( data[stateTileScaler.indexOf(true)],dataType[stateTileScaler.indexOf(true)],widget.requiredPower),
                                  
                                  //selectionBehavior: _selectionBehavior,
                                  xValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.time,
                                  yValueMapper:
                                      (ConsomeElectricPowerData sales, _) =>
                                          sales.consumerFate,
                                  width: 2,
                                  //color: kPrimaryColor,
                                  name: 'Required',
                                  markerSettings:
                                      const MarkerSettings(isVisible: true)),
                            ]),
                      ),
                    )
                  ],
                )));
  }
}