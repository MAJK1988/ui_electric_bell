import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ui_electric_bell/constants.dart';

class BillInforShow extends StatefulWidget{
  final Size size;
  final String limitedDay;
  final String units;
  final String billPrice;
  const BillInforShow({Key? key,
  required this.size,
  required this.limitedDay,
  required this.units,
  required this.billPrice}) : super(key: key);

  @override
  State<BillInforShow> createState()=> _StateBillInforShow();
}

class _StateBillInforShow extends State<BillInforShow>{
  @override
  Widget build(BuildContext context) {
   return Container(
          height: widget.size.height*0.25,
          decoration:getBoxDecoration(kBackgroundColor),
          margin: EdgeInsets.only(
          right:  widget.size.width*0.05,
          top:  widget.size.height*0.02,
          left:  widget.size.width*0.05),
          child:Stack(
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children:<Widget>[

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/meter.png"),
                          Column(

                            children: <Widget>[
                              Text(DateFormat.yMMMd().format(DateTime.now()),
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(0,0,0,1)
                                ),
                              ),

                              Row(
                                children: <Widget>[
                                  const Text("Due Date ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(0,0,0,.5)
                                    ),
                                  ),
                                  Text(widget.limitedDay,
                                    style:const TextStyle(
                                        fontSize: 13,
                                        color: Color.fromRGBO(40, 175, 111,1)
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Text(widget.units,
                            style:const TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(0,0,0,1)
                            ),
                          ),
                          const Text("Units",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(0,0,0,.5)
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Row(
                        children: <Widget>[
                          Image.asset("assets/images/bill.png"),
                          const Text(" Bill Amount",
                            style: TextStyle(fontSize: 14,
                              color: Color.fromRGBO(0,0,0,.5)
                            ),
                          )
                        ],
                      ),

                      Text("\$ ${widget.billPrice}",
                        style:const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(0,0,0,1)
                        ),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      InkWell(
                        onTap: (){},
                        child:const Text("View Breakdown",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(26, 141, 255,1)
                          ),
                        ),
                      ),

                      RaisedButton(
                        onPressed: (){},
                        color:const Color.fromRGBO(26, 141, 255,1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),

                        child:const Text("Pay Bill",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255,1)
                          ),
                        ),
                      )
                    ],
                  ),
                  ]
                ),
              )
            ]
          )
          );;
  }

}
