import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ui_electric_bell/constants.dart';

class ElectrictyConsumption extends StatefulWidget{
  final Size size;
  final double value;
  final String title;
  final double max;
  const ElectrictyConsumption({Key? key,
  required this.size,
  required this.value,
  required this.title,
   required this.max}) : super(key: key);

  @override
  State<ElectrictyConsumption> createState() => _StateElectrictyConsumption();
}

class _StateElectrictyConsumption extends State<ElectrictyConsumption>{
  double width=5;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        SizedBox(
          height: widget.size.height*0.2,
          width: widget.size.width*0.4,

          child: SfRadialGauge(
            enableLoadingAnimation: true, animationDuration: 4500,
            axes: <RadialAxis>[
              RadialAxis(minimum: 0,maximum: widget.max,
                  ranges: <GaugeRange>[
                    GaugeRange(startValue: 0,endValue: widget.max/3,color: Colors.green,startWidth: width,endWidth: width),
                    GaugeRange(startValue: widget.max/3,endValue: widget.max*(2/3),color: Colors.orange,startWidth: width,endWidth: width),
                    GaugeRange(startValue: widget.max*(2/3),endValue: widget.max,color: Colors.red,startWidth: width,endWidth: width)],
                  pointers: <GaugePointer>[NeedlePointer(value: widget.value, 
                  needleStartWidth: 1, needleEndWidth: 5,
                    knobStyle: const KnobStyle(knobRadius: 0.05, borderColor: Colors.black,
                     borderWidth: 0.02, 
                     color: Colors.white
                    )
                  )],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(widget: Padding(
                      padding: const EdgeInsets.only(top:35.0),
                      child: Text('${widget.value}',
                      style: TextStyle(fontSize: 12,fontWeight:FontWeight.bold,color: kPrimaryColor,)),
                    ),
                        angle: 90,positionFactor: 0.5)]
                )]
              ),
        ),
             Text(widget.title,
            style:const TextStyle(
              fontWeight:FontWeight.bold,
            fontSize: 12))
      ],
    );

  }
}