import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui_electric_bell/composent/plot.dart';
import 'package:ui_electric_bell/constants.dart';
/// Chart import
import 'package:ui_electric_bell/setting/comparison.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

GlobalKey globalKey = GlobalKey();
class FixationOfThreshold extends StatefulWidget{
  const FixationOfThreshold({Key? key}) : super(key: key);

  @override
  State<FixationOfThreshold> createState() => _FixationOfThresholdState();
  
}

class _FixationOfThresholdState extends State<FixationOfThreshold>{

late  FToast fToast;
late bool isTap=false;


Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.error),
        SizedBox(
          width: 12.0,
        ),
        Text("Please type the wanted amount"),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration:const Duration(seconds: 3),
    );
  }

  String? get _errorText {
  // at any time, we can get the text from _controller.value.text
  final text = textController.value.text;
  // Note: you can do your own custom validation here
  // Move this logic this outside the widget for more testable code
  if (text.isEmpty && isTap) {
    return 'Can\'t be empty';
  }
  // return null if the text is valid
  return null;
}
late Size size=MediaQuery.of(context).size;

 TextEditingController textController = TextEditingController();
  double number=0;
  bool showComperasons=false;
  double _value = 4.0;


late ChartSampleData dataDaily= ChartSampleData(
          period: 'Daily',
          average: averageDay,
          required_: 3.5);
          late ChartSampleData dataWeekly= ChartSampleData(
          period: 'Weekly',
          average: averageWeek,
          required_: 24.5);
          late ChartSampleData dataMonthly= ChartSampleData(
          period: 'Monthly',
          average: averageMonth,
          required_: 100);
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

    @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Fiaxiation of a threshold'),
        backgroundColor:kPrimaryColor
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           
            children: [
              Container(
                decoration: getBoxDecoration(kBackgroundColor),
                child: TextField(
                  

                  keyboardType: TextInputType.number,
                  controller: textController,
                   decoration:   InputDecoration(
                     errorText: _errorText,
                     border: const OutlineInputBorder(
                       borderSide: BorderSide.none
                       ),
                       hintStyle: TextStyle(color: kPrimaryColor),
                       hintText: "Enter the amount you want to spend",
                       ),)),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return kBackgroundColor;
                      }),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                    (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.pressed)
                      ? Colors.blue
                      : kPrimaryColor;
                      return BorderSide(color: color, width: 2);
                      }),),
                onPressed: () {
                  setState(() {
                    isTap=true;
                  });
                  if(textController.text!='')
                  {setState(() {
                    number=double.parse(textController.text);
                    dataDaily.required_=number;
                    dataWeekly.required_=7*number;
                    dataMonthly.required_=30*number;
                    showComperasons=true;
                  });}else{
                      _showToast();
                  }
                },
                child: Text("SHOW THE COMPERSON!!",style: TextStyle(color: kPrimaryColor),),),
              if (showComperasons)...[
              Comperson(size: size,title: 'Daily Comperson',data:dataDaily),
              Comperson(size: size,title: 'Weekly Comperson',data:dataWeekly),
              Comperson(size: size,title: 'Monthly Comperson',data:dataMonthly),
              Plot(size: size,plotTwoLine: true,requiredPower: number),
              
          

              ]
            ],
          ),
        ),
      )
    );
  }
}
